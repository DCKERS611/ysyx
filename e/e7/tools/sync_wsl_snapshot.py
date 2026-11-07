#!/usr/bin/env python3
"""在 Ubuntu-22.04 中按原相对路径同步工作台，默认仅审计，--apply 才复制。"""

import argparse
from datetime import datetime
import hashlib
import json
import os
from pathlib import Path
import shutil
from zoneinfo import ZoneInfo


SOURCE = Path('/home/ysyx/ysyx-workbench')
DESTINATION = Path('/mnt/e/ysyx/e/e7')
SKIP_DIRECTORIES = {
    '.git', '__pycache__', '.pytest_cache', '.cache', 'node_modules',
    '.idea', '.vscode', '.bloop', '.metals',
}
SKIP_SUFFIXES = {'.o', '.a', '.so', '.dll', '.exe', '.pyc', '.pyo', '.d', '.pid', '.swp', '.swo'}
EVIDENCE = DESTINATION / 'verification' / datetime.now(ZoneInfo('Asia/Shanghai')).strftime('%Y-%m-%d') / 'sync-audit'


def digest(path):
    result = hashlib.sha256()
    with path.open('rb') as stream:
        for chunk in iter(lambda: stream.read(1024 * 1024), b''):
            result.update(chunk)
    return result.hexdigest()


def exclusion(path):
    # 不用源码扩展名白名单；仅明确排除编译产物、缓存与编辑器临时文件。
    name = path.name
    if name == '.git' or name == '.env' or name.startswith('.env.') and name != '.env.example':
        return 'repository metadata or local environment'
    # 课程预编译klib是当前测试的实际输入，源码仍含未实现桩，不能当缓存丢弃。
    if path.relative_to(SOURCE).as_posix() in {
        'abstract-machine/klib/build/klib-minirv-npc.a',
        'abstract-machine/klib/build/klib-minirv-ysyxsoc.a',
    }:
        return None
    if path.suffix in SKIP_SUFFIXES or name.endswith('~'):
        return 'compiled output or temporary file'
    # 上游跟踪的调试镜像是测试输入，不把预置 ELF 误判成临时编译输出。
    if path.relative_to(SOURCE).as_posix().startswith('riscv-tests/debug/bin/'):
        return None
    try:
        with path.open('rb') as stream:
            magic = stream.read(8)
    except FileNotFoundError:
        return 'broken symlink'
    if magic.startswith((b'\x7fELF', b'!<arch>\n', b'MZ')):
        return 'host/target executable or compiled library'
    return None


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--apply', action='store_true')
    parser.add_argument('--verify-links', action='store_true', help='Windows 原生链接建立后，复核并完成清单')
    options = parser.parse_args()
    if not SOURCE.is_dir() or not DESTINATION.is_dir():
        raise SystemExit('Source or destination is missing')
    projects = sorted(path.name for path in SOURCE.iterdir()
                      if path.is_dir() and path.name not in SKIP_DIRECTORIES | {'ecc', 'icsprout55-pdk'})
    projects += sorted(path.relative_to(SOURCE).as_posix() for path in (SOURCE / 'ecc').iterdir()
                       if path.is_dir() and path.name not in SKIP_DIRECTORIES | {'_internal'})
    if options.verify_links:
        report_path = EVIDENCE / 'sync-manifest.json'
        report = json.loads(report_path.read_text(encoding='utf-8'))
        for item in report['links']:
            path = DESTINATION / item['path']
            expected = (path.parent / item['target']).resolve()
            if not expected.is_relative_to(DESTINATION) or not path.is_symlink() or path.resolve() != expected:
                raise SystemExit('Symlink verification failed: ' + item['path'])
            if item.get('kind') != 'directory' and digest(path) != digest(SOURCE / item['path']):
                raise SystemExit('Symlink content differs: ' + item['path'])
        report['mode'] = 'applied and verified'
        report['links_verified'] = True
        report_path.write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
        print('Verified native symlinks: ' + str(len(report['links'])))
        return
    files, links, directories, skipped = [], [], set(), []

    def select(path):
        relative = path.relative_to(SOURCE).as_posix()
        reason = exclusion(path)
        if reason:
            skipped.append({'path': relative, 'reason': reason})
        elif path.is_symlink():
            links.append({'path': relative, 'target': os.readlink(path)})
        else:
            files.append((path, DESTINATION / relative, relative))

    for name in projects:
        root = SOURCE / name
        if not root.is_dir():
            raise SystemExit('Missing source project: ' + name)
        for here, children, names in os.walk(root, followlinks=False):
            directories.add(Path(here).relative_to(SOURCE).as_posix())
            kept = []
            for child in children:
                path = Path(here) / child
                relative = path.relative_to(SOURCE).as_posix()
                if child in SKIP_DIRECTORIES or child.startswith('obj_dir'):
                    skipped.append({'path': relative + '/', 'reason': 'metadata, cache or generated compiler directory'})
                elif path.is_symlink():
                    links.append({'path': relative, 'target': os.readlink(path), 'kind': 'directory'})
                else:
                    kept.append(child)
            children[:] = kept
            for name in names:
                select(Path(here) / name)

    # 根目录两份同名文件属于 Windows 导航/发布策略，不覆盖；源件另存。
    for path in SOURCE.iterdir():
        if path.is_file() and path.name not in {'.gitignore', 'README.md'}:
            select(path)
    for path in (SOURCE / 'ecc').iterdir():
        if path.is_file() and path.name not in {'ecc', 'ecc-cli-linux-x86_64.tar.gz'}:
            select(path)
    for name in ['README.md', '.gitignore']:
        files.append((SOURCE / name, EVIDENCE / 'wsl-workbench-root' / name, name + ' (Windows root exception)'))

    changed, inventory = [], []
    for path, destination, relative in sorted(files, key=lambda item: item[2]):
        source_hash = digest(path)
        same = destination.is_file() and not destination.is_symlink() and digest(destination) == source_hash
        if not same:
            changed.append(str(destination.relative_to(DESTINATION)))
            if options.apply:
                destination.parent.mkdir(parents=True, exist_ok=True)
                if destination.is_symlink():
                    destination.unlink()
                shutil.copy2(path, destination)
        if options.apply and (digest(destination) != source_hash or digest(path) != source_hash):
            raise SystemExit('File changed during synchronization: ' + relative)
        inventory.append({'source': path.relative_to(SOURCE).as_posix(), 'destination': destination.relative_to(DESTINATION).as_posix(), 'bytes': path.stat().st_size, 'sha256': source_hash, 'executable': bool(path.stat().st_mode & 0o111)})
        if options.apply and len(inventory) % 500 == 0:
            print('verified_files=' + str(len(inventory)), flush=True)

    if options.apply:
        for relative in sorted(directories):
            (DESTINATION / relative).mkdir(parents=True, exist_ok=True)
    for item in links:
        path = DESTINATION / item['path']
        expected = (path.parent / item['target']).resolve()
        if not expected.is_relative_to(DESTINATION):
            raise SystemExit('Symlink target outside snapshot: ' + item['path'])
        correct = path.is_symlink() and path.resolve() == expected
        if not correct:
            changed.append(item['path'] + ' (restore symlink)')

    report = {
        'source_root': str(SOURCE), 'destination_root': str(DESTINATION),
        'mode': 'regular files verified; native links pending' if options.apply else 'audit only',
        'links_verified': False,
        'projects': projects, 'regular_files': len(inventory),
        'bytes': sum(item['bytes'] for item in inventory), 'links': links,
        'directories': sorted(directories), 'changed': changed,
        'files': inventory, 'excluded': skipped,
        'tool_exclusions': ['.git/', 'ecc/ecc', 'ecc/_internal/', 'ecc/ecc-cli-linux-x86_64.tar.gz', 'icsprout55-pdk/'],
        'root_exceptions': ['README.md', '.gitignore'],
        'deletion_policy': 'No general destination deletion; remove wrong mappings only after separate review.',
    }
    if options.apply:
        EVIDENCE.mkdir(parents=True, exist_ok=True)
        (EVIDENCE / 'sync-manifest.json').write_text(json.dumps(report, ensure_ascii=False, indent=2) + '\n', encoding='utf-8')
    print(json.dumps({key: report[key] for key in ['mode', 'regular_files', 'bytes', 'links']}, ensure_ascii=False, indent=2))
    print('changed_paths=' + str(len(changed)))


if __name__ == '__main__':
    main()
