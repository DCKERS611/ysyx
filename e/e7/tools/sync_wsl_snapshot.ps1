# 在 Windows PowerShell 中运行；默认审计，-Apply 才复制与修复链接。
[CmdletBinding()]
param([switch]$Apply)

$ErrorActionPreference = 'Stop'
$snapshotRoot = [IO.Path]::GetFullPath('E:\ysyx\e\e7\')
$pythonScript = '/mnt/e/ysyx/e/e7/tools/sync_wsl_snapshot.py'
$snapshotDate = [TimeZoneInfo]::ConvertTimeBySystemTimeZoneId([DateTime]::UtcNow, 'China Standard Time').ToString('yyyy-MM-dd')
$manifestPath = Join-Path $snapshotRoot ('verification\' + $snapshotDate + '\sync-audit\sync-manifest.json')

if (-not $Apply) {
    wsl.exe -d Ubuntu-22.04 -u ysyx -- python3 $pythonScript
    if ($LASTEXITCODE -ne 0) { throw 'WSL 同步审计失败' }
    return
}

wsl.exe -d Ubuntu-22.04 -u ysyx -- python3 $pythonScript --apply
if ($LASTEXITCODE -ne 0) { throw '普通文件同步或哈希核对失败' }
$manifest = Get-Content -LiteralPath $manifestPath -Raw -Encoding UTF8 | ConvertFrom-Json

foreach ($link in $manifest.links) {
    $linkPath = [IO.Path]::GetFullPath((Join-Path $snapshotRoot $link.path))
    $linkParent = Split-Path -Parent $linkPath
    $linkTarget = $link.target.Replace('/', '\')
    $targetPath = [IO.Path]::GetFullPath((Join-Path $linkParent $linkTarget))
    if (-not $linkPath.StartsWith($snapshotRoot, [StringComparison]::OrdinalIgnoreCase) -or
        -not $targetPath.StartsWith($snapshotRoot, [StringComparison]::OrdinalIgnoreCase)) {
        throw ('链接或目标超出 E7 范围：' + $link.path)
    }
    $existing = Get-Item -LiteralPath $linkPath -Force -ErrorAction SilentlyContinue
    if ($existing -and $existing.LinkType -eq 'SymbolicLink' -and $existing.Target -eq $linkTarget) { continue }
    if ($existing -and -not $existing.LinkType) {
        if ($existing.PSIsContainer) { throw ('链接位置已有真实目录，需人工核对：' + $link.path) }
        if ((Get-FileHash -LiteralPath $linkPath).Hash -ne (Get-FileHash -LiteralPath $targetPath).Hash) {
            throw ('链接位置已有不同内容，停止覆盖：' + $link.path)
        }
    }
    if ($existing) { Remove-Item -LiteralPath $linkPath -Force }
    Push-Location -LiteralPath $linkParent
    try {
        New-Item -ItemType SymbolicLink -Path $linkPath -Target $linkTarget | Out-Null
    } finally {
        Pop-Location
    }
}

wsl.exe -d Ubuntu-22.04 -u ysyx -- python3 $pythonScript --verify-links
if ($LASTEXITCODE -ne 0) { throw '原生链接复核失败' }
Write-Output ('同步及原生链接核验完成；清单：' + $manifestPath)
