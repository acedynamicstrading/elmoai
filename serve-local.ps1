$ErrorActionPreference = 'Stop'
Set-Location $PSScriptRoot
$port = 8765
Write-Host ""
Write-Host "Elmo AI — serving this folder at http://localhost:$port" -ForegroundColor Cyan
Write-Host "Open that URL in your browser (do not use file://)." -ForegroundColor Gray
Write-Host "Press Ctrl+C to stop." -ForegroundColor Gray
Write-Host ""
if (Get-Command python -ErrorAction SilentlyContinue) {
  python -m http.server $port
} elseif (Get-Command py -ErrorAction SilentlyContinue) {
  py -m http.server $port
} elseif (Get-Command npx -ErrorAction SilentlyContinue) {
  npx --yes serve . -l $port
} elseif (Get-Command php -ErrorAction SilentlyContinue) {
  php -S "localhost:${port}"
} else {
  Write-Host "No local server found. Install Python, Node.js (npx), or PHP, then run this script again." -ForegroundColor Red
  exit 1
}
