## Load Homepsick
Import-Module -Name "$([IO.Path]::Combine($home, ".homesick", "repos", "homepsick", "src", "Homepsick.psm1"))" -Force

## Update my Homepsick repos
Update-HomepsickCastle -All

## Link everything
Enable-HomepsickCastle -All

## Load Starship Prompt
Invoke-Expression (&starship init powershell)

## Load Terminal Icons
Import-Module -Name Terminal-Icons