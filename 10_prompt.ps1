function prompt
{
    function w ($m,$c='Gray') { Write-Host $m -NoNewline -ForegroundColor $c }
    function admin() {
        $wid=[System.Security.Principal.WindowsIdentity]::GetCurrent()
        $prp=new-object System.Security.Principal.WindowsPrincipal($wid)
        $adm=[System.Security.Principal.WindowsBuiltInRole]::Administrator
        if ($prp.IsInRole($adm)) { "(admin)" } 
    }

    if (gcm RenameTab.cmd -ea 0) { RenameTab Split-Path $pwd -Leaf }

    $date   = Get-Date -Format "yy-MM-dd HH:mm:ss"
    $cmd_no = (history).length + 1

    $color = if (admin) {"Yellow"} else { "Gray"}
    w ('-'*$Host.UI.RawUI.WindowSize.Width) $color
    w "$cmd_no"   Yellow
    w "  "        Gray
    w $date       Red
    w "  "        Gray
    w "$pwd"      Green
    w " $(admin)" Yellow
    write-host
    w ">"
    return " "
 }
