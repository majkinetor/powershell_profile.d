# PowerShell profile.d

This repository contains PowerShell profile with snippets organized in `profile.d` directory.

## Concept

- All of the scripts that you want in each of your machines go into the `profile.d`. Those are considered mandatory PowerShell extensions you can't live without.
- All machine specific stuff (aliases, functions etc.) should be set in `$PROFILE` itself.

## Installation

```powershell
$profile_dir = Split-Path $PROFILE
mkdir $profile_dir -ea 0
git clone https://github.com/majkinetor/powershell_profile.d $profile_dir/profile.d
'# set profile.d, see https://github.com/majkinetor/powershell_profile.d
ls "$(Split-Path $profile)/profile.d/*.ps1" | % { . $_.FullName }
' | Out-File -Encoding ascii -Append $PROFILE
```

## Notes

- To not see warnings add `$WarningPreference = 'SilentlyContinue'` after the comment and restore it back to `$WarningPreference = 'Continue'` after the scripts are loaded.
