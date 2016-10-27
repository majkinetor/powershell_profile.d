function prompt
{
    function w ($m,$c='Gray') { Write-Host $m -NoNewline -ForegroundColor $c }
    function admin() {
        $wid=[System.Security.Principal.WindowsIdentity]::GetCurrent()
        $prp=new-object System.Security.Principal.WindowsPrincipal($wid)
        $adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
        if ($prp.IsInRole($adm)) { "(admin)" } 
    }

    $lec = $LastExitCode
    #if (gcm RenameTab.cmd -ea 0) { RenameTab (Split-Path $pwd -Leaf) | out-null }
    if (gcm git.exe -ea 0) {
        $gs = git status -sb 2>$null
        if ($gs){
            $git = @{ status = '[ clean ]' }
            $git.branch = $gs[0] -replace '## (.+?)\.\.\..+', '$1'
            $files = $gs | select -Skip 1
            if ($files) {
                foreach ($file in $files.Trim()) {
                    $af = $file -split ' '
                    $git[ $af[0] ] += @(($af | select -skip 1) -join ' ')
                }
                $git.status = " [ M:{0} D:{1} A:{2} ?:{3} ]" -f $git.M.Length, $git.D.Length, $git.A.Length, $git['??'].Length
            }
        }
    }

    $date   = Get-Date -Format "yy-MM-dd HH:mm:ss"
    $cmd_no = (history).length + 1

    $color = if (admin) {"Yellow"} else { "Gray"}
    w ('-'*$Host.UI.RawUI.WindowSize.Width) $color
    w "$cmd_no"   Yellow
    if ($lec -ne 0) { w " LEC $lec" Red }
    if ($git) { w $git.status Green }
    w "  "        Gray
    w $date       Red
    w "  "        Gray
    w "$pwd"      Green
    w " $(admin)" Yellow
    write-host
    if ($git) { w $git.branch Red }
    w ">"

    $LastExitCode = $lec
    return " "
 }
