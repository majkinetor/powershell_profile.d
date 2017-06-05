# profile_modules_path could be set in $PROFILE
if (!$profile_modules_path) { $profile_modules_path = Resolve-Path "$PSScriptRoot\..\posh" -ea 0 }

if ($profile_modules_path -and (Test-Path $profile_modules_path)) {
    $Env:PSModulePath += ";$profile_modules_path"
    Write-Warning "Importing majkinetor's posh modules"
    import-module mm_sugar, mm_network, mm_admin        #auto-load not working ?
    Set-AppKeyAliases *> $null
} else {
    Write-Warning "majkinetor's modules not found at $(Resolve-Path $PSScriptRoot\..)\posh`n         git clone https://github.com/majkinetor/posh $profile_modules_path"
}

rm Variable:/profile_modules_path
