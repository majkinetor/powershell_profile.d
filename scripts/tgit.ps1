# Last Change: 02-Apr-2017.
# Author: M. Milic <miodrag.milic@gmail.com>

<#
.SYNOPSIS
    Drive TortoiseGit via command line

.DESCRIPTION
    A simple script to be able to run TortoiseGit options via command line instead invoking it using GUI.

.EXAMPLE
    tgit commit /

    Open commit dialog from the root of the repository

.LINK
    https://tortoisegit.org/docs/tortoisegit/tgit-automation.html
#>
function tgit()  {
    param(
        # TortoiseGit command
        [ValidateSet('fetch', 'firststart', 'log', 'clone', 'commit', 'add', 'revert', 'cleanup', 'resolve', 'repocreate', 'switch', 'export', 'merge', 'settings', 'remove', 'rename', 'diff', 'showcompare', 'conflicteditor', 'help', 'repostatus', 'repobrowser', 'ignore', 'blame', 'cat', 'pull', 'push', 'rebase', 'stashsave', 'stashapply', 'stashpop', 'subadd', 'subupdate', 'subsync', 'reflog', 'refbrowse', 'updatecheck', 'revisiongraph', 'daemon', 'tag')]
        [string] $Command='commit',

        # Many commands require PATH argument. Special value '/' means root of the repository.
        [string] $Path = '.'
    )

    if ($Path -eq '/') { $Path = git rev-parse --show-toplevel }
    & "$Env:ProgramFiles\TortoiseGit\bin\TortoiseGitProc.exe" "/command:$Command" "/path:$Path"
}
