<#
.SYNOPSIS
  One entry point for everyday Absorb Plus work on Windows.

.DESCRIPTION
  check      pub get, analyze, full test suite, tool tests, removed-paths check,
             settings-key naming (tool/pref_keys.py --check), fork-only lints
             (tool/fork_lints.py)
             check -Quick: for iterating. Analyze, then only the tests that
             import a changed lib/ file (changed vs claude/slim, committed or
             not) plus changed tests; skips fork lints, and pub get unless
             pubspec changed. Run the full check before merging or building.
  build      Windows release into build\windows\x64\runner\Release, then
             verify the exe's version matches pubspec.yaml and refresh the
             owner's test copy in Desktop\Absorb Plus Beta
  beta-sync  refresh Desktop\Absorb Plus Beta from the last build (when it
             was open during the build)
  apk        signed phone-test APK from CI into Absorb Plus Beta\Android
             (~10 min; run it in the background), then onto the fork's
             rolling test-channel pre-release for the app's Developer mode >
             Test channel (-NoPublish skips that)
  bump      next build number (+1) in pubspec.yaml, for every build the
             owner gets. The beta number (lib/build_info.dart) names the
             next beta to be published and stays put; after publishing one,
             run bump -NextBeta (or -Beta N to set it).
  clean      free build\ and .dart_tool\ safely (unlinks the Pub-cache
             junctions first, then flutter clean + pub get); the next
             build is a full one
  footprint  how far the fork's lib/ code differs from upstream
  merge      merge upstream origin/main with the fork's rules
             (tool/upstream_merge.py); never commits
  server     the throwaway Audiobookshelf test server (tool/test-server),
             127.0.0.1:13378 only: server up | seed | down | reset
             (reset deletes only tool/test-server/data)
  itest      integration tests (test/integration, tag abs-server) against
             that server, credentials from tool/test-server/.env; never part
             of check

  The committed */flutter/generated_plugin* files match what `pub get`
  writes; if a pubspec change alters them, commit the regenerated files.

.EXAMPLE
  .\tool\dev.ps1 check
  .\tool\dev.ps1 build
  .\tool\dev.ps1 build -CloseRunning   # gracefully close a running Release build first
  .\tool\dev.ps1 bump
  .\tool\dev.ps1 server up; .\tool\dev.ps1 server seed; .\tool\dev.ps1 itest
#>
param(
  [Parameter(Mandatory = $true, Position = 0)]
  [ValidateSet('check', 'build', 'beta-sync', 'apk', 'bump', 'clean', 'footprint', 'merge', 'server', 'itest')]
  [string]$Command,
  [Parameter(Position = 1)]
  [string]$Action = '',
  [int]$Beta = 0,
  [switch]$CloseRunning,
  [switch]$Local,
  [switch]$NextBeta,
  [switch]$NoPublish,
  [switch]$Quick,
  [switch]$Full
)
$script:ShowFull = [bool]$Full

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
Set-Location $root

$flutter = if ($env:FLUTTER) { $env:FLUTTER }
  elseif (Test-Path 'C:\Users\pc\develop\flutter\bin\flutter.bat') { 'C:\Users\pc\develop\flutter\bin\flutter.bat' }
  else { 'flutter' }
# NuGet (installed per user by winget) is needed by the WebView plugin build.
$wingetLinks = Join-Path $env:LOCALAPPDATA 'Microsoft\WinGet\Links'
if ((Test-Path $wingetLinks) -and ($env:Path -notlike "*$wingetLinks*")) {
  $env:Path = "$env:Path;$wingetLinks"
}

# Full tool output goes to build\dev-logs\; the console gets one line per step
# (and the tail of the log only when a step fails). Keeps Claude's context
# small. Pass -Full to stream everything.
$logDir = Join-Path $root 'build\dev-logs'
New-Item -ItemType Directory -Force -Path $logDir | Out-Null
function Invoke-Step {
  param([string]$Name, [scriptblock]$Run, [string]$SummaryPattern = '')
  $log = Join-Path $logDir "$Name.log"
  if ($script:ShowFull) {
    & $Run 2>&1 | Tee-Object -FilePath $log
  } else {
    & $Run *> $log
  }
  $code = $LASTEXITCODE
  if ($code -ne 0) {
    Write-Host "FAILED: $Name (exit $code). Last lines of $log :" -ForegroundColor Red
    Get-Content $log -Tail 40 | ForEach-Object { Write-Host "  $_" }
    throw "$Name failed"
  }
  $summary = if ($SummaryPattern) {
    (Select-String -Path $log -Pattern $SummaryPattern | Select-Object -Last 1).Line
  }
  Write-Host ("ok: $Name" + $(if ($summary) { " - $($summary.Trim())" } else { '' }))
}
function Invoke-Flutter {
  $words = @($args | Where-Object { $_ -notlike '-*' } | Select-Object -First 2)
  $name = 'flutter-' + ($words -join '-')
  $flutterArgs = $args
  Invoke-Step -Name $name -Run { & $flutter @flutterArgs } `
    -SummaryPattern 'No issues found|issues found|All tests passed|tests? passed|Built '
}
# Asks running absorb.exe copies to quit and waits up to 15 s. The window may
# be hidden in the tray (Close to tray), where CloseMainWindow cannot reach
# it, so the runner's "AbsorbPlus.QuitRequest" message goes first; it saves
# progress and exits. CloseMainWindow covers builds older than that message.
function Stop-AbsorbGracefully {
  param([System.Diagnostics.Process[]]$Processes)
  if (-not ('AbsorbDev.Native' -as [type])) {
    Add-Type -Namespace AbsorbDev -Name Native -MemberDefinition @'
[DllImport("user32.dll", CharSet = CharSet.Unicode)] public static extern uint RegisterWindowMessage(string name);
[DllImport("user32.dll")] public static extern bool PostMessage(IntPtr hwnd, uint msg, IntPtr w, IntPtr l);
public delegate bool EnumProc(IntPtr hwnd, IntPtr l);
[DllImport("user32.dll")] public static extern bool EnumWindows(EnumProc proc, IntPtr l);
[DllImport("user32.dll")] public static extern uint GetWindowThreadProcessId(IntPtr hwnd, out uint pid);
[DllImport("user32.dll", CharSet = CharSet.Unicode)] public static extern int GetClassName(IntPtr hwnd, System.Text.StringBuilder name, int max);
public static void RequestQuit(uint pid) {
  uint message = RegisterWindowMessage("AbsorbPlus.QuitRequest");
  EnumWindows((h, l) => {
    uint owner; GetWindowThreadProcessId(h, out owner);
    var name = new System.Text.StringBuilder(64); GetClassName(h, name, 64);
    if (owner == pid && name.ToString() == "FLUTTER_RUNNER_WIN32_WINDOW") PostMessage(h, message, IntPtr.Zero, IntPtr.Zero);
    return true;
  }, IntPtr.Zero);
}
'@
  }
  foreach ($p in $Processes) {
    [AbsorbDev.Native]::RequestQuit([uint32]$p.Id)
    [void]$p.CloseMainWindow()
  }
  $deadline = (Get-Date).AddSeconds(15)
  while ((Get-Date) -lt $deadline -and
         (Get-Process -Id $Processes.Id -ErrorAction SilentlyContinue)) {
    Start-Sleep -Milliseconds 500
  }
}
# The owner's always-current test copy (Desktop\Absorb Plus Beta): Windows\
# is refreshed after every build, Android\ by `apk`, and "What's new.txt"
# lists the changes since the last published release. Copies never delete
# anything; a running copy is left alone and refreshed next time.
$BetaDir = Join-Path ([Environment]::GetFolderPath('Desktop')) 'Absorb Plus Beta'
function Write-BetaNotes {
  param([string]$AndroidRun = '')
  New-Item -ItemType Directory -Force -Path $BetaDir | Out-Null
  $notesPath = Join-Path $BetaDir "What's new.txt"
  $winVersion = ''
  $winExe = Join-Path $BetaDir 'Windows\absorb.exe'
  if (Test-Path $winExe) { $winVersion = (Get-Item $winExe).VersionInfo.ProductVersion }
  $beta = (Select-String -Path lib/build_info.dart -Pattern 'kBetaNumber = (\d+)').Matches[0].Groups[1].Value
  $lastTag = (git describe --tags --abbrev=0 --match 'v*' 2>$null)
  $range = if ($lastTag) { "$lastTag..HEAD" } else { 'HEAD~30..HEAD' }
  # Owner-facing wording: "New / Fixed / Faster", no commit prefixes.
  $label = @{ feat = 'New'; fix = 'Fixed'; perf = 'Faster' }
  $changes = git log --no-merges --format='%s' $range | ForEach-Object {
    if ($_ -match '^(feat|fix|perf)(\([^)]*\))?:\s*(.+)$') {
      $text = $Matches[3]
      "- $($label[$Matches[1]]): $($text.Substring(0,1).ToUpper())$($text.Substring(1))"
    }
  }
  $androidLine = if ($AndroidRun -eq 'local') { "Android: Android\Absorb Plus beta.apk (built on this PC, $(Get-Date -Format 'yyyy-MM-dd HH:mm'))" }
    elseif ($AndroidRun) { "Android: Android\Absorb Plus beta.apk (CI run $AndroidRun, $(Get-Date -Format 'yyyy-MM-dd HH:mm'))" }
    elseif (Test-Path (Join-Path $BetaDir 'Android\Absorb Plus beta.apk')) {
      $old = Select-String -Path $notesPath -Pattern '^Android: ' -ErrorAction SilentlyContinue | Select-Object -First 1
      if ($old) { $old.Line } else { 'Android: Android\Absorb Plus beta.apk' }
    } else { 'Android: not built yet (run tool\dev.ps1 apk)' }
  @(
    "Absorb Plus test build - upcoming Beta $beta (not published yet)"
    "Windows: Windows\absorb.exe $winVersion ($(Get-Date -Format 'yyyy-MM-dd HH:mm'))"
    $androidLine
    ''
    "Changes since the last published release ($lastTag):"
    $changes
  ) | Set-Content -Path $notesPath -Encoding utf8
}
function Update-BetaFolder {
  $src = Join-Path $root 'build\windows\x64\runner\Release'
  $dst = Join-Path $BetaDir 'Windows'
  $dstExe = Join-Path $dst 'absorb.exe'
  $running = Get-Process -Name absorb -ErrorAction SilentlyContinue |
    Where-Object { $_.Path -eq $dstExe }
  if ($running -and $CloseRunning) {
    # Works even when the window is hidden in the tray.
    Stop-AbsorbGracefully $running
    $running = Get-Process -Id $running.Id -ErrorAction SilentlyContinue
  }
  if ($running) {
    Write-BetaNotes  # the change list stays current even when the app can't be swapped
    Write-Host "beta folder: Absorb is open from it (maybe in the tray), so the app was not refreshed. Run: .\tool\dev.ps1 beta-sync -CloseRunning" -ForegroundColor Yellow
    return
  }
  New-Item -ItemType Directory -Force -Path $dst | Out-Null
  robocopy $src $dst /E /R:1 /W:1 /NFL /NDL /NJH /NJS /NP | Out-Null
  if ($LASTEXITCODE -ge 8) { throw "Copy to the beta folder failed (robocopy $LASTEXITCODE)" }
  $global:LASTEXITCODE = 0
  # A debug build leaves a ~120 MB kernel_blob.bin that release builds never
  # use; the copy above never deletes, so drop it from both folders.
  foreach ($dir in @($src, $dst)) {
    $blob = Join-Path $dir 'data\flutter_assets\kernel_blob.bin'
    if (Test-Path -LiteralPath $blob -PathType Leaf) { Remove-Item -LiteralPath $blob -Force }
  }
  # Same for the Tailscale library: a build made without it must not keep an
  # older one (possibly with a different C ABI) in the beta folder.
  $tsDll = 'absorb_tailscale.dll'
  if (-not (Test-Path -LiteralPath (Join-Path $src $tsDll) -PathType Leaf) -and
      (Test-Path -LiteralPath (Join-Path $dst $tsDll) -PathType Leaf)) {
    Remove-Item -LiteralPath (Join-Path $dst $tsDll) -Force
  }
  Write-BetaNotes
  Write-Host "beta folder: $dst ($((Get-Item $dstExe).VersionInfo.ProductVersion))" -ForegroundColor Green
}
function Get-PubspecVersion {
  $line = Select-String -Path pubspec.yaml -Pattern '^version:\s*(\S+)' | Select-Object -First 1
  return $line.Matches[0].Groups[1].Value
}
# The test channel: one rolling GitHub pre-release, tag "test-channel", in the
# separate public repo atewertfd/absorb-plus-test-builds (owner, 2026-11-03),
# so the main repo's Releases page only shows real betas and releases. Developer mode > Test channel in the Android app installs the
# APK from it. Puts this APK there as absorb-plus-test-<version>+<build>.apk,
# then removes older APKs and sets the notes to "What's new". Touches no other
# release or tag and never marks anything Latest. Skip with -NoPublish.
function Publish-TestChannelCore {
  param([string]$ApkPath, [string]$Version, [string]$Commit)
  $repo = 'atewertfd/absorb-plus-test-builds'
  $tag = 'test-channel'
  if ($Version -notmatch '^\d+\.\d+\.\d+\+\d+$') { throw "Unexpected version for the test channel: $Version" }
  $name = "absorb-plus-test-$Version.apk"
  $work = Join-Path $env:TEMP "absorb-test-channel-$PID"
  New-Item -ItemType Directory -Force -Path $work | Out-Null
  $asset = Join-Path $work $name
  Copy-Item -LiteralPath $ApkPath -Destination $asset -Force
  # Notes: the change list from "What's new" (not its local folder lines).
  $whatsNew = Join-Path $BetaDir "What's new.txt"
  $lines = @(if (Test-Path -LiteralPath $whatsNew) { Get-Content -LiteralPath $whatsNew })
  $start = 0
  for ($i = 0; $i -lt $lines.Count; $i++) { if ($lines[$i] -like 'Changes since*') { $start = $i; break } }
  $short = if ($Commit.Length -ge 8) { $Commit.Substring(0, 8) } else { $Commit }
  $notesFile = Join-Path $work 'notes.md'
  $notes = @(
    "Test build $Version (commit $short). Not a release: install it from Developer mode > Test channel in the Android app."
    ''
    $(if ($lines.Count) { $lines[$start..($lines.Count - 1)] })
  )
  # No BOM (Windows PowerShell's utf8 adds one, which would show in the notes).
  [IO.File]::WriteAllLines($notesFile, [string[]]$notes, (New-Object Text.UTF8Encoding $false))

  # Native errors must not stop the script here (a missing release is a 404).
  $prevPreference = $ErrorActionPreference
  $ErrorActionPreference = 'Continue'
  try {
    $lookup = (gh api "repos/$repo/releases/tags/$tag" --jq '.id' 2>&1 | Out-String)
    $exists = $LASTEXITCODE -eq 0
    $global:LASTEXITCODE = 0
    # Only "not found" means it is missing; anything else (offline, signed
    # out) must not lead to a second create.
    if (-not $exists -and $lookup -notmatch '404|Not Found') {
      throw "Could not look up the test channel release: $($lookup.Trim())"
    }
    if (-not $exists) {
      # --target only takes a commit GitHub has; otherwise the default branch.
      gh api "repos/$repo/commits/$Commit" --jq '.sha' *> $null
      $targetArgs = if ($LASTEXITCODE -eq 0) { @('--target', $Commit) } else { @() }
      $global:LASTEXITCODE = 0
    }
  } finally {
    $ErrorActionPreference = $prevPreference
  }
  if ($exists) {
    Invoke-Step -Name 'test-channel-upload' -Run { gh release upload $tag $asset --repo $repo --clobber }
    Invoke-Step -Name 'test-channel-notes' -Run {
      gh release edit $tag --repo $repo --prerelease --latest=false --notes-file $notesFile
    }
  } else {
    Invoke-Step -Name 'test-channel-create' -Run {
      gh release create $tag $asset --repo $repo --prerelease --latest=false `
        --title 'Test channel (not a release)' --notes-file $notesFile @targetArgs
    }
  }
  # Older test APKs go once the new one is up, so the channel is never empty.
  $names = @(gh release view $tag --repo $repo --json assets --jq '.assets[].name')
  if ($LASTEXITCODE -ne 0) { throw 'Could not list the test channel files.' }
  # GitHub may store the "+" as another character, so match the new file
  # loosely rather than by its exact name.
  $core, $build = $Version -split '\+'
  $current = "^absorb-plus-test-$([regex]::Escape($core))[+._ -]$build\.apk$"
  if (-not ($names | Where-Object { $_ -match $current })) {
    Write-Warning "The test channel doesn't list the new APK ($name); older APKs were left there."
    $names = @()
  }
  foreach ($old in $names) {
    if ($old -notmatch $current -and $old -like 'absorb-plus-test-*.apk') {
      Invoke-Step -Name 'test-channel-prune' -Run { gh release delete-asset $tag $old --repo $repo --yes }
    }
  }
  Write-Host "test channel: $name (https://github.com/$repo/releases/tag/$tag)" -ForegroundColor Green
}
# A failed publish only warns: the APK in the beta folder is already fine.
function Publish-TestChannel {
  param([string]$ApkPath, [string]$Version, [string]$Commit)
  try {
    Publish-TestChannelCore -ApkPath $ApkPath -Version $Version -Commit $Commit
  } catch {
    Write-Warning "Test channel not updated: $_ (the APK in the beta folder is fine; -NoPublish skips this step)"
  } finally {
    # Only the two files this step wrote; never a recursive delete.
    $work = Join-Path $env:TEMP "absorb-test-channel-$PID"
    Get-ChildItem -LiteralPath $work -File -ErrorAction SilentlyContinue |
      Remove-Item -Force -ErrorAction SilentlyContinue
    Remove-Item -LiteralPath $work -Force -ErrorAction SilentlyContinue
  }
}

switch ($Command) {
  'check' {
    if ($Quick) {
      # What changed: since this branch left the integration branch, committed
      # or not, plus untracked files. On claude/slim itself: since fork/claude/slim.
      $head = git rev-parse HEAD
      $slim = git rev-parse --verify --quiet claude/slim
      $base = if ($slim -and $slim -ne $head) { git merge-base HEAD claude/slim }
              elseif (git rev-parse --verify --quiet fork/claude/slim) { git merge-base HEAD fork/claude/slim }
              else { $head }
      $changed = @(@(git diff --name-only $base) + @(git ls-files --others --exclude-standard) |
        Where-Object { $_ } | Sort-Object -Unique)
      $needPub = -not (Test-Path (Join-Path $root '.dart_tool\package_config.json')) -or
        ($changed | Where-Object { $_ -in 'pubspec.yaml', 'pubspec.lock' })
      if ($needPub) { Invoke-Flutter pub get }
      Invoke-Flutter analyze --no-pub --no-fatal-infos
      $pkg = ((Get-Content (Join-Path $root 'pubspec.yaml') | Select-String '^name:\s*(\S+)').Matches[0].Groups[1].Value)
      $libChanged = @($changed | Where-Object { $_ -like 'lib/*.dart' })
      $tests = @($changed | Where-Object { $_ -like 'test/*_test.dart' -and $_ -notlike 'test/integration/*' })
      if ($libChanged.Count) {
        $needles = @($libChanged | ForEach-Object { "package:$pkg/" + $_.Substring(4) })
        $tests += @(Get-ChildItem (Join-Path $root 'test') -Recurse -Filter '*_test.dart' |
          Where-Object { $_.FullName -notlike '*\test\integration\*' } |
          Where-Object { Select-String -Path $_.FullName -SimpleMatch -Pattern $needles -Quiet } |
          ForEach-Object { $_.FullName.Substring($root.Length + 1).Replace('\', '/') })
      }
      $tests = @($tests | Sort-Object -Unique)
      if ($tests.Count) {
        Invoke-Step -Name 'flutter-test-quick' -Run { & $flutter test --no-pub --reporter expanded @tests } `
          -SummaryPattern 'All tests passed|tests? passed|Some tests failed'
        Write-Host "  ($($tests.Count) test file(s) for $($libChanged.Count) changed lib file(s))"
      } else {
        Write-Host "ok: no tests import the $($libChanged.Count) changed lib file(s)"
      }
      if ($changed | Where-Object { $_ -like 'tool/*.py' -or $_ -like 'tool/tests/*' }) {
        Invoke-Step -Name 'tool-tests' -Run { python -m unittest discover -s tool/tests } `
          -SummaryPattern '^Ran \d+ tests'
      }
      Invoke-Step -Name 'removed-paths' -Run { python tool/check_fork_removed.py } -SummaryPattern '^OK'
      Write-Host 'quick check passed (run the full check before merging or building)' -ForegroundColor Green
      break
    }
    Invoke-Flutter pub get
    Invoke-Flutter analyze --no-pub --no-fatal-infos
    Invoke-Flutter test --no-pub --reporter expanded
    Invoke-Step -Name 'tool-tests' -Run { python -m unittest discover -s tool/tests } `
      -SummaryPattern '^Ran \d+ tests'
    # The maintainer's hooks live in the private .claude repo (git-ignored here).
    if (Test-Path (Join-Path $root '.claude\hooks\tests')) {
      Invoke-Step -Name 'hook-tests' -Run { python -m unittest discover -s .claude/hooks/tests } `
        -SummaryPattern '^Ran \d+ tests'
    }
    Invoke-Step -Name 'removed-paths' -Run { python tool/check_fork_removed.py } -SummaryPattern '^OK'
    # New fork settings keys are fork_snake_case (tool/pref_keys.py).
    Invoke-Step -Name 'pref-keys' -Run { python tool/pref_keys.py --check } -SummaryPattern '^(OK|FAIL)'
    # Lints only fork-added files must pass (one extra analyzer run).
    $env:FLUTTER = $flutter
    Invoke-Step -Name 'fork-lints' -Run { python tool/fork_lints.py } -SummaryPattern '^(OK|FAIL)'
    Write-Host 'check passed' -ForegroundColor Green
  }

  'clean' {
    # Frees build\ and .dart_tool\ (often 10+ GB). */flutter/ephemeral/.plugin_symlinks
    # hold junctions into the shared Pub cache, and a recursive delete through
    # them once emptied cached packages. So each link is removed by itself
    # first (a non-recursive Directory.Delete never follows a junction), then
    # flutter clean removes the rest. Never use Remove-Item -Recurse here.
    $exe = Join-Path $root 'build\windows\x64\runner\Release\absorb.exe'
    if (Get-Process absorb -ErrorAction SilentlyContinue | Where-Object { $_.Path -eq $exe }) {
      throw 'The Release absorb.exe is running from build\. Close it first.'
    }
    foreach ($os in 'windows', 'linux') {
      $links = Join-Path $root "$os\flutter\ephemeral\.plugin_symlinks"
      if (-not (Test-Path -LiteralPath $links)) { continue }
      $kids = @(Get-ChildItem -LiteralPath $links -Force)
      $real = @($kids | Where-Object { -not ($_.Attributes -band [IO.FileAttributes]::ReparsePoint) })
      if ($real.Count) { throw "$links holds real folders, not links; stopping so nothing is deleted through them." }
      foreach ($k in $kids) { [IO.Directory]::Delete($k.FullName, $false) }
      [IO.Directory]::Delete($links, $false)
    }
    # Not through Invoke-Step: its log lives in build\, which this deletes.
    & $flutter clean *> $null
    if ($LASTEXITCODE -ne 0) { throw "flutter clean failed (exit $LASTEXITCODE)" }
    New-Item -ItemType Directory -Force -Path $logDir | Out-Null
    Invoke-Flutter pub get
    Write-Host 'clean done: build output removed; the next build is a full one' -ForegroundColor Green
  }

  'merge' {
    python tool/upstream_merge.py
    Write-Host 'Merge prepared (not committed). Resolve anything listed, then run check and build.' -ForegroundColor Yellow
  }

  'build' {
    $exe = Join-Path $root 'build\windows\x64\runner\Release\absorb.exe'
    $running = Get-Process -Name absorb -ErrorAction SilentlyContinue |
      Where-Object { $_.Path -eq $exe }
    if ($running) {
      if (-not $CloseRunning) {
        throw "The Release absorb.exe is running (pid $($running.Id)). Close it or pass -CloseRunning."
      }
      Stop-AbsorbGracefully $running
      if (Get-Process -Id $running.Id -ErrorAction SilentlyContinue) {
        throw 'absorb.exe did not close; close it manually and retry.'
      }
    }
    if (-not (Get-Command nuget -ErrorAction SilentlyContinue)) {
      throw 'NuGet CLI not found. Install it with: winget install Microsoft.NuGet'
    }
    Invoke-Flutter pub get
    Invoke-Flutter build windows --release --no-pub --dart-define=GITHUB_BUILD=true
    $expected = Get-PubspecVersion
    $actual = (Get-Item $exe).VersionInfo.ProductVersion
    if ($actual -ne $expected) { throw "absorb.exe reports $actual but pubspec.yaml says $expected" }
    Write-Host "built $exe ($actual, $((Get-Item $exe).LastWriteTime))" -ForegroundColor Green
    Update-BetaFolder
  }

  'beta-sync' { Update-BetaFolder }

  'apk' {
    # A signed phone-test APK into the beta folder. -Local builds it on this
    # PC (needs the Android SDK and android\key.properties, made once by the
    # owner with tool\android-signing-setup.ps1); otherwise CI builds it for
    # the current branch (~9 minutes). Run either in the background.
    if ($Local) {
      if (-not (Test-Path 'android\key.properties')) {
        throw 'No signing setup on this PC: the owner runs tool\android-signing-setup.ps1 once.'
      }
      Invoke-Step -Name 'flutter-pub-get' -Run { & $flutter pub get }
      Invoke-Step -Name 'apk-local' -Run {
        # The "Absorb Plus Test" app: dev flavor (own app id, installs beside
        # the normal app) with Developer mode and the test channel compiled in.
        & $flutter build apk --release --no-pub --flavor dev --target-platform android-arm64 --dart-define=GITHUB_BUILD=true --dart-define=ABSORB_TEST_BUILD=true
      }
      $apk = Get-ChildItem 'build\app\outputs\flutter-apk' -Filter '*dev-release*.apk' |
        Sort-Object LastWriteTime -Descending | Select-Object -First 1
      if (-not $apk) { throw 'The build produced no APK.' }
      Invoke-Step -Name 'apk-signature' -Run { python tool/ci/verify_apk_signature.py $apk.FullName }
      $dest = Join-Path $BetaDir 'Android'
      New-Item -ItemType Directory -Force -Path $dest | Out-Null
      Copy-Item $apk.FullName (Join-Path $dest 'Absorb Plus Test.apk') -Force
      Write-BetaNotes -AndroidRun 'local'
      Write-Host "APK ready: $(Join-Path $dest 'Absorb Plus Test.apk')" -ForegroundColor Green
      if (-not $NoPublish) {
        $headSha = (git rev-parse HEAD).Trim()
        Publish-TestChannel -ApkPath $apk.FullName -Version (Get-PubspecVersion) -Commit $headSha
      }
      break
    }
    $branch = (git rev-parse --abbrev-ref HEAD).Trim()
    $repo = 'atewertfd/absorb-plus'
    # Download only the run this call starts: a workflow_dispatch run that
    # didn't exist before, on the commit the branch points at on GitHub, and
    # created after the dispatch (an older run's APK would be a stale build).
    $sha = (gh api "repos/$repo/branches/$branch" --jq '.commit.sha').Trim()
    if (-not $sha) { throw "Branch $branch isn't on $repo; push it first." }
    if ($sha -ne (git rev-parse HEAD).Trim()) {
      Write-Warning "GitHub's $branch is at $($sha.Substring(0, 8)), not your HEAD; the APK is built from GitHub's commit."
    }
    $listRuns = {
      gh run list --repo $repo --workflow ci.yml --branch $branch --event workflow_dispatch --limit 20 `
        --json databaseId,headSha,createdAt | ConvertFrom-Json
    }
    # PowerShell 7's ConvertFrom-Json already turns createdAt into a DateTime;
    # Windows PowerShell leaves the ISO string.
    $utc = {
      param($t)
      if ($t -isnot [DateTime]) {
        $t = [DateTime]::Parse([string]$t, [Globalization.CultureInfo]::InvariantCulture,
          [Globalization.DateTimeStyles]::AdjustToUniversal -bor [Globalization.DateTimeStyles]::AssumeUniversal)
      }
      $t.ToUniversalTime()
    }
    $beforeIds = @(& $listRuns | ForEach-Object { [string]$_.databaseId })
    # A little slack for clock skew between this PC and GitHub.
    $dispatchedAt = [DateTime]::UtcNow.AddSeconds(-30)
    gh workflow run ci.yml --repo $repo --ref $branch | Out-Null
    if ($LASTEXITCODE -ne 0) { throw 'gh workflow run failed.' }
    $runId = $null
    for ($i = 0; $i -lt 30 -and -not $runId; $i++) {
      Start-Sleep -Seconds 4
      $match = & $listRuns | Where-Object {
        ($beforeIds -notcontains [string]$_.databaseId) -and
        $_.headSha -eq $sha -and
        ((& $utc $_.createdAt) -ge $dispatchedAt)
      } | Sort-Object { & $utc $_.createdAt } | Select-Object -First 1
      if ($match) { $runId = [string]$match.databaseId }
    }
    if (-not $runId) { throw 'Could not find the CI run that was just started.' }
    Write-Host "CI run $runId building the APK..."
    Invoke-Step -Name 'apk-ci' -Run { gh run watch $runId --repo $repo --exit-status --interval 30 }
    $tmp = Join-Path $env:TEMP "absorb-apk-$runId"
    New-Item -ItemType Directory -Force -Path $tmp | Out-Null
    Invoke-Step -Name 'apk-download' -Run { gh run download $runId --repo $repo -n absorb-android-apk -D $tmp }
    $apk = Get-ChildItem $tmp -Filter *.apk -Recurse | Select-Object -First 1
    if (-not $apk) { throw 'The CI run produced no APK.' }
    $dest = Join-Path $BetaDir 'Android'
    New-Item -ItemType Directory -Force -Path $dest | Out-Null
    Copy-Item $apk.FullName (Join-Path $dest 'Absorb Plus beta.apk') -Force
    Write-BetaNotes -AndroidRun $runId
    Write-Host "APK ready: $(Join-Path $dest 'Absorb Plus beta.apk')" -ForegroundColor Green
    # CI builds the normal app (github flavor), not the Absorb Plus Test app,
    # so it never goes to the test channel; test builds come from -Local.
    if ($false) {
      # The version of the commit CI built (GitHub's branch head), when this
      # checkout has it; otherwise the local pubspec.yaml.
      $builtVersion = Get-PubspecVersion
      $prevPreference = $ErrorActionPreference
      $ErrorActionPreference = 'Continue'
      $builtPubspec = git show "${sha}:pubspec.yaml" 2>$null
      if ($LASTEXITCODE -eq 0 -and (($builtPubspec -join "`n") -match '(?m)^version:\s*(\S+)')) {
        $builtVersion = $Matches[1]
      }
      $global:LASTEXITCODE = 0
      $ErrorActionPreference = $prevPreference
      Publish-TestChannel -ApkPath $apk.FullName -Version $builtVersion -Commit $sha
    }
  }

  'bump' {
    $version = Get-PubspecVersion
    if ($version -notmatch '^(\d+\.\d+\.\d+)\+(\d+)$') { throw "Unexpected version: $version" }
    $next = "$($Matches[1])+$([int]$Matches[2] + 1)"
    $info = Get-Content lib/build_info.dart -Raw
    if ($info -notmatch 'const int kBetaNumber = (\d+);') { throw 'kBetaNumber not found' }
    # Releases are batched: the beta number names the next beta to publish
    # and only moves after one is published (-NextBeta) or is set (-Beta N).
    $current = [int]$Matches[1]
    $beta = if ($Beta -gt 0) { $Beta } elseif ($NextBeta) { $current + 1 } else { $current }
    (Get-Content pubspec.yaml -Raw) -replace "(?m)^version:\s*\S+", "version: $next" |
      Set-Content pubspec.yaml -NoNewline
    $info -replace 'const int kBetaNumber = \d+;', "const int kBetaNumber = $beta;" |
      Set-Content lib/build_info.dart -NoNewline
    Write-Host "version $version -> $next, beta -> $beta (commit with: chore: bump build identifier to $next (Beta $beta))" -ForegroundColor Green
  }

  'server' {
    # Throwaway Audiobookshelf for integration tests. Never the owner's server.
    $serverDir = Join-Path $root 'tool\test-server'
    $compose = @('compose', '-f', (Join-Path $serverDir 'docker-compose.yml'))
    if ($Action -notin @('up', 'seed', 'down', 'reset')) {
      throw 'Usage: dev.ps1 server up|seed|down|reset'
    }
    docker info *> $null
    if ($LASTEXITCODE -ne 0) { throw 'Docker engine is not running. Start Docker Desktop and retry.' }
    switch ($Action) {
      'up' {
        Invoke-Step -Name 'server-up' -Run { docker @compose up -d }
        $deadline = (Get-Date).AddSeconds(120)
        $ready = $false
        while (-not $ready -and (Get-Date) -lt $deadline) {
          try {
            $ready = (Invoke-WebRequest 'http://127.0.0.1:13378/healthcheck' -TimeoutSec 3).StatusCode -eq 200
          } catch { Start-Sleep -Seconds 2 }
        }
        if (-not $ready) { throw 'Test server did not answer on 127.0.0.1:13378 within 120 s (docker compose logs abs).' }
        Write-Host 'ok: server ready on http://127.0.0.1:13378'
      }
      'seed' {
        Invoke-Step -Name 'server-seed' -Run { python (Join-Path $serverDir 'seed.py') } -SummaryPattern '^seed: done'
      }
      'down' { Invoke-Step -Name 'server-down' -Run { docker @compose down } }
      'reset' {
        Invoke-Step -Name 'server-down' -Run { docker @compose down -v --remove-orphans }
        # Only ever the git-ignored data folder, and never through a link.
        $data = Join-Path $serverDir 'data'
        if (Test-Path -LiteralPath $data) {
          $links = @(Get-ChildItem -LiteralPath $data -Recurse -Force -Attributes ReparsePoint -ErrorAction SilentlyContinue)
          if ($links.Count -gt 0) { throw "Refusing to delete ${data}: it contains a link ($($links[0].FullName))" }
          Remove-Item -LiteralPath $data -Recurse -Force
        }
        Write-Host "ok: server reset ($data removed; .env kept for reuse)"
      }
    }
  }

  'itest' {
    # Integration tests against tool/test-server. dart_test.yaml skips the
    # abs-server tag everywhere else, so --run-skipped is what enables them;
    # each suite still skips itself when the server or credentials are missing.
    $envFile = Join-Path $root 'tool\test-server\.env'
    if (Test-Path -LiteralPath $envFile) {
      foreach ($line in Get-Content -LiteralPath $envFile) {
        if ($line -match '^\s*(ABS_TEST_\w+)\s*=\s*(.*)$') {
          Set-Item -Path "env:$($Matches[1])" -Value $Matches[2].Trim()
        }
      }
    } else {
      Write-Host 'No tool/test-server/.env: tests will skip (run server up, then server seed).' -ForegroundColor Yellow
    }
    Invoke-Step -Name 'flutter-itest' `
      -Run { & $flutter test --no-pub --tags abs-server --run-skipped --concurrency=1 --reporter expanded test/integration } `
      -SummaryPattern '^\d+:\d+ \+\d+.*(passed|skipped|failed)'
  }

  'footprint' {
    git fetch origin main --quiet
    git diff --stat origin/main -- lib ':!lib/l10n' | Select-Object -Last 1
    Write-Host 'Largest differences from upstream (fork-only files count in full):'
    git diff --numstat origin/main -- lib ':!lib/l10n' |
      ForEach-Object { $c = $_ -split "`t"; [pscustomobject]@{ Lines = [int]$c[0] + [int]$c[1]; File = $c[2] } } |
      Sort-Object Lines -Descending | Select-Object -First 10 | Format-Table -AutoSize
  }
}

# pub get rewrites */flutter/generated_plugin*. When the content is unchanged
# but the size Git recorded differs (an old CRLF checkout), `git status` keeps
# calling them modified without comparing content. Re-recording them is a
# no-op for content; files whose content really changed are left alone.
if ($Command -in 'check', 'build', 'clean', 'apk') {
  $gen = @(git ls-files -m -- 'windows/flutter/generated_plugin*' 'linux/flutter/generated_plugin*')
  foreach ($f in $gen) {
    git diff --quiet -- $f
    if ($LASTEXITCODE -eq 0) { git add -- $f }
  }
}
