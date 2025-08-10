Param(
  [string]$Date = $(Get-Date -Format 'yyyy-MM-dd')
)

$Root = Split-Path -Parent (Split-Path -Parent $MyInvocation.MyCommand.Path)
$Dest = Join-Path $Root "daily\$Date"
$Template = Join-Path $Root "templates\daily"

if (Test-Path $Dest) {
  Write-Host "Daily folder already exists: $Dest"
  exit 0
}

New-Item -ItemType Directory -Force -Path $Dest | Out-Null

Get-ChildItem "$Template\*.md" | ForEach-Object {
  $content = Get-Content $_.FullName -Raw
  $content = $content -replace "{{DATE}}", $Date
  $outPath = Join-Path $Dest $_.Name
  Set-Content -Path $outPath -Value $content -NoNewline
}

Write-Host "Created $Dest"
Write-Host "Next:"
Write-Host "  git add daily/$Date; git commit -m 'chore(daily): scaffold $Date'; git push"