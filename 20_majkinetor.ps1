if (!$profile_modules_path) { $profile_modules_path = "C:\Work\posh" }

if (Test-Path $profile_modules_path) {
    $Env:PSModulePath += ";$profile_modules_path"
    Write-Warning "Importing majkinetor's posh modules"
    import-module mm_sugar, mm_network, mm_admin        #auto-load not working ?
    Set-AppKeyAliases *> $null
} else {
    Write-Warning "majkinetor's modules not found at '$profile_modules_path'`ngit clone https://github.com/majkinetor/posh $profile_modules_path"
}

rm Variable:/profile_modules_path
