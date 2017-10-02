# Attach spawned intances to conemu
if (Test-Path $Env:ProgramFiles\ConEmu) { & $Env:ProgramFiles\ConEmu\ConEmu\ConEmuC.exe /AUTOATTACH }

# Remove PSCX less helper, I already use my own less
if (gmo -List pscx) { ($Pscx:Preferences).PageHelpUsingLess = $false }

# Do not use any proxy server for posh remoting
$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer

# Prevent garbage in logs
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Delete some aliases that I actually use original tools
'wget', 'curl' | % { rm  Alias:\$_ -ea 0 }

# Force AU update
function fup() { $global:au_force = $true; ./update.ps1}

sal pester Invoke-Pester
sal ib     Invoke-Build
if (Test-Path $env:ChocolateyInstall\lib\invoke-build) { & "$env:ChocolateyInstall\lib\invoke-build\tools\Invoke-Build.ArgumentCompleters.ps1" }

