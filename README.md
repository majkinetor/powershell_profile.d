# PowerShell profile.d

This repository contains PowerShell profile with snippets organized in `profile.d` directory.

## Concept

- All of the scripts that you want in each of your machines go into the `profile.d`. Those are considered mandatory PowerShell extensions you can't live without.
- All machine specific stuff (aliases, functions etc.) should be set in `$PROFILE` itself.

## Installation

Installation requires git client: `cinst git`.

```powershell

git clone https://github.com/majkinetor/powershell_profile.d

"`n# set profile.d, see https://github.com/majkinetor/powershell_profile.d
ls '$pwd\powershell_profile.d\*.ps1' | % { . `$_.FullName } # 3>`$null
" | Out-File -Encoding ascii -Append $PROFILE
```

## Notes

- To not see warnings on the start uncomment `3>$null` in a profile.