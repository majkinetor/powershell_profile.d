if (!(gcm git -ea 0)) { Write-Warning "Git profile: git is not found on path" }

# Set TortoiseGit helpers
$tortoise_git_path = "$Env:ProgramFiles\TortoiseGit"
if (Test-Path $tortoise_git_path) {
    . $PSScriptRoot\scripts\tgit.ps1

    # Ask for password in GUI (easier to see and automate)
    #https://marcus.handte.org/2011/09/07/enabling-interactive-prompts-in-cygwins-git-port/
    $ENV:GIT_ASKPASS  = "$tortoise_git_path\bin\sshaskpass.exe"
} else { Write-Warning "Git profile: TortoiseGit not found" }
rm Variable:/tortoise_git_path

# Set git editor
# if (gcm gvim -ea 0) { $Env:GIT_EDITOR = 'gvim' } else { Write-Warning 'Git profile: gvim not found' }
$Env:GIT_EDITOR = 'code'
