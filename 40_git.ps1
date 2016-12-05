# Drive TortoiseGit via command line
#https://tortoisegit.org/docs/tortoisegit/tgit-automation.html
function tgit( $Command, $Path = '.' ) {
    & "C:\Program Files\TortoiseGit\bin\TortoiseGitProc.exe" "/command:$Command" "/path:$Path"
}

# Ask for password in GUI (easier to see and automate)
#https://marcus.handte.org/2011/09/07/enabling-interactive-prompts-in-cygwins-git-port/
sshaskpass_path = 'C:\Program Files\TortoiseGit\bin\sshaskpass.exe'
if (Test-Path $sshaskpass_path) { $ENV:GIT_ASKPASS  = $sshaskpass_path }
rm Variable:/sshaskpass_path
