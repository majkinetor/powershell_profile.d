if (!(gcm git -ea 0)) { Write-Warning "Git profile: git is not found on path" }

# Drive TortoiseGit via command line
#https://tortoisegit.org/docs/tortoisegit/tgit-automation.html
function tgit( $Command='commit', $Path = '.' ) {
    if ($Path -eq '/') { $Path = git rev-parse --show-toplevel }
    & "$Env:ProgramFiles\TortoiseGit\bin\TortoiseGitProc.exe" "/command:$Command" "/path:$Path"
}

# Ask for password in GUI (easier to see and automate)
#https://marcus.handte.org/2011/09/07/enabling-interactive-prompts-in-cygwins-git-port/
$sshaskpass_path = 'C:\Program Files\TortoiseGit\bin\sshaskpass.exe'
if (Test-Path $sshaskpass_path) { $ENV:GIT_ASKPASS  = $sshaskpass_path } else { Write-Warning 'Git profile: sshaskpass not found' }
rm Variable:/sshaskpass_path

#Set git editor
if (gcm gvim -ea 0) { $Env:GIT_EDITOR = 'gvim' } else { Write-Warning 'Git profile: gvim not found' }

