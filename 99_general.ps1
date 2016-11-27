if (Test-Path  $Env:ProgramFiles\ConEmu) { & $Env:ProgramFiles\ConEmu\ConEmu\ConEmuC.exe /AUTOATTACH }

if (gmo -List pscx) { ($Pscx:Preferences).PageHelpUsingLess = $false }

$PSSessionOption = New-PSSessionOption -ProxyAccessType NoProxyServer

[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

#delete some aliases
'wget', 'curl' | % { rm  Alias:\$_ -ea 0 }

#https://tortoisegit.org/docs/tortoisegit/tgit-automation.html
function tgit() { & "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" "/command:$args" /path:. }
