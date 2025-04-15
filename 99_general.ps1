# Show menu on {Tab} ASAP
#Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete

# Attach spawned intances to conemu
#if (Test-Path $Env:ProgramFiles\ConEmu\ConEmuC.exe) { & $Env:ProgramFiles\ConEmu\ConEmu\ConEmuC.exe /AUTOATTACH }

# Remove PSCX less helper, I already use my own less
# if (gmo -List pscx) { ($Pscx:Preferences).PageHelpUsingLess = $false }

# Do not use any proxy server for posh remoting
$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer

# Use UTF8
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

# Delete some aliases for which I use original tools
'wget', 'curl' | % { rm  Alias:\$_ -ea 0 }

sal pester Invoke-Pester

sal ib Invoke-Build
& $PSScriptRoot\scripts\Invoke-Build.ArgumentCompleters.ps1


#[System.Net.ServicePointManager]::SecurityProtocol = 3072 -bor 768 -bor [System.Net.SecurityProtocolType]::Tls -bor [System.Net.SecurityProtocolType]::Ssl3
