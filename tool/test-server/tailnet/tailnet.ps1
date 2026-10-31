# Throwaway tailnet for the built-in Tailscale end-to-end test.
#   up    start headscale + a tailnet node in front of the test Audiobookshelf,
#         write tool/test-server/tailnet/.env (git-ignored) for the test
#   down  stop it and delete its volumes (the test ABS is left alone)
# Never points at a real tailnet or the owner's server. Keys are never printed.
param([Parameter(Mandatory)][ValidateSet('up', 'down')][string]$Action)
$ErrorActionPreference = 'Stop'
$dir = $PSScriptRoot
$envFile = Join-Path $dir '.env'
$compose = @('compose', '-f', (Join-Path $dir 'docker-compose.yml'), '--env-file', $envFile)

function Invoke-Headscale([string[]]$HsArgs) {
  $out = docker exec absorb-test-headscale headscale @HsArgs 2>&1
  if ($LASTEXITCODE -ne 0) { throw "headscale $($HsArgs[0]) failed: $out" }
  return ($out | Out-String)
}

if ($Action -eq 'down') {
  if (-not (Test-Path $envFile)) { Set-Content $envFile 'TS_SERVER_AUTHKEY=unused' }
  docker @compose down -v --remove-orphans 2>&1 | Out-Null
  Remove-Item $envFile -ErrorAction SilentlyContinue
  Write-Host 'ok: tailnet removed'
  return
}

$abs = docker ps --filter 'name=^absorb-test-abs$' --format '{{.Names}}'
if (-not $abs) { throw 'Start the test server first: .\tool\dev.ps1 server up' }

# headscale first (the node needs a key from it).
Set-Content $envFile 'TS_SERVER_AUTHKEY=pending'
docker @compose up -d headscale holder 2>&1 | Out-Null
$deadline = (Get-Date).AddSeconds(60)
while ((Get-Date) -lt $deadline) {
  try { Invoke-RestMethod -TimeoutSec 2 http://127.0.0.1:18080/health | Out-Null; break } catch { Start-Sleep -Milliseconds 500 }
}

$users = Invoke-Headscale @('users', 'list', '-o', 'json') | ConvertFrom-Json
if (-not ($users | Where-Object name -eq 'absorbtest')) {
  Invoke-Headscale @('users', 'create', 'absorbtest') | Out-Null
  $users = Invoke-Headscale @('users', 'list', '-o', 'json') | ConvertFrom-Json
}
$userId = ($users | Where-Object name -eq 'absorbtest').id

function New-Key {
  $k = Invoke-Headscale @('preauthkeys', 'create', '--user', "$userId", '--reusable', '--expiration', '2h', '-o', 'json') | ConvertFrom-Json
  return $k.key
}
$serverKey = New-Key
$clientKey = New-Key

Set-Content $envFile "TS_SERVER_AUTHKEY=$serverKey"
docker @compose up -d abs-node 2>&1 | Out-Null

# Wait for the node to get its tailnet IP.
$ip = $null
$deadline = (Get-Date).AddSeconds(90)
while (-not $ip -and (Get-Date) -lt $deadline) {
  Start-Sleep -Seconds 1
  $ip = (docker exec absorb-test-tailnet-abs-node tailscale ip -4 2>$null | Select-Object -First 1)
}
if (-not $ip) { throw 'The tailnet node did not come up (docker logs absorb-test-tailnet-abs-node).' }

@(
  "TS_SERVER_AUTHKEY=$serverKey"
  'TS_TEST_CONTROL_URL=http://127.0.0.1:18080'
  "TS_TEST_AUTHKEY=$clientKey"
  "TS_TEST_ABS_URL=http://$($ip.Trim())"
  'TS_TEST_ABS_DNS_URL=http://abs.tailnet.test'
) | Set-Content $envFile
Write-Host "ok: tailnet up; test server reachable in it at http://$($ip.Trim()) (keys in tool/test-server/tailnet/.env)"
