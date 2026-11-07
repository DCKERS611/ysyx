#!/usr/bin/env python3
"""检查重建阶段b沿前提交语义、两拍间隔及等待拍无写入。"""
import sys,json
from pathlib import Path
scope=[];ids={};values={};pending={};header=True;last_commit=None
rises=commits=loads=stores=waits=0
def flush():
    global rises,commits,loads,stores,waits,last_commit
    if not pending:return
    before=dict(values);values.update(pending);pending.clear()
    def old(name):return before.get(ids[name],0)
    def now(name):return values.get(ids[name],0)
    if old('clk')==0 and now('clk')==1 and not old('rst'):
        rises+=1
        if old('commit'):
            if last_commit is not None:assert rises-last_commit==2,('commit spacing',rises,last_commit)
            last_commit=rises;commits+=1
            if old('inst')&0x7f==3:
                loads+=1;assert old('mem_ren')==1
            if old('inst')&0x7f==0x23:
                stores+=1;assert old('mem_wen')==1
        else:
            waits+=1
            assert now('pc')==old('pc'),('PC changed during wait',rises)
            assert not old('mem_wen') and not old('mem_ren'),('memory side effect during wait',rises)
with Path(sys.argv[1]).open() as f:
    for raw in f:
        line=raw.strip()
        if header:
            parts=line.split()
            if line.startswith('$scope'):scope.append(parts[2])
            elif line.startswith('$upscope'):scope.pop()
            elif line.startswith('$var') and scope==['TOP']:ids[parts[4]]=parts[3]
            elif line.startswith('$enddefinitions'):header=False
            continue
        if line.startswith('#'):flush()
        elif line.startswith('b'):
            value,key=line[1:].split()
            if 'x' not in value and 'z' not in value:pending[key]=int(value,2)
        elif line and line[0] in '01':pending[line[1:]]=int(line[0])
flush()
assert commits and loads and stores and waits
print(json.dumps({'passed':True,'rising_edges':rises,'commits':commits,'loads':loads,'stores':stores,'wait_edges':waits,'commit_spacing_cycles':2,'pre_edge_sampling':True},indent=2))
