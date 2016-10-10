$profile_ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path $profile_ChocolateyProfile) {
    Import-Module "$profile_ChocolateyProfile"
} else  {
    Write-Warning 'Chocolatey profile not found'
}

rm Variable:/profile_ChocolateyProfile
