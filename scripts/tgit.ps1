<#PSScriptInfo
.VERSION 0.2
.GUID 88f076e7-0c1f-48b3-a122-29cea3c34728
.AUTHOR miodrag.milic@gmail.com
.COPYRIGHT Miodrag Milic
.TAGS git tortoisegit
.LICENSEURI https://opensource.org/licenses/MIT
.PROJECTURI https://github.com/majkinetor/powershell_profile.d/blob/master/scripts/tgit.ps1
#>

param($Command='commit', $Path='.')

<#
.SYNOPSIS
    Drive TortoiseGit via command line

.DESCRIPTION
    TortoiseGit simple CLI interface

.EXAMPLE
    tgit commit /

    Open commit dialog from the root of the repository

.LINK
    https://tortoisegit.org/docs/tortoisegit/tgit-automation.html
#>
function tgit {
    param(
        # TortoiseGit command
        [ValidateSet('fetch', 'firststart', 'log', 'clone', 'commit', 'add', 'revert', 'cleanup', 'resolve', 'repocreate', 'revisiongraph', 'switch', 'export', 'merge', 'settings', 'remove', 'rename', 'diff', 'showcompare', 'conflicteditor', 'help', 'repostatus', 'repobrowser', 'ignore', 'blame', 'cat', 'pull', 'push', 'rebase', 'stashsave', 'stashapply', 'stashpop', 'subadd', 'subupdate', 'subsync', 'sync', 'reflog', 'refbrowse', 'updatecheck', 'revisiongraph', 'daemon', 'tag')]
        [string] $Command='commit',

        # Many commands require PATH argument. Special value '/' means root of the repository.
        [string] $Path = '.'
    )

    if ($Path -eq '/') { $Path = git rev-parse --show-toplevel }
    & "$Env:ProgramFiles\TortoiseGit\bin\TortoiseGitProc.exe" "/command:$Command" "/path:$Path"
}

 if ($MyInvocation.InvocationName -ne '.') { tgit -Command $Command -Path $Path }
