# This file and this entire repo began modeled after https://github.com/onlyhavecans/dotfiles

# Do a curlbash to allow me to take over your system
# Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://raw.githubusercontent.com/NikoSteph/dotfiles/main/init.ps1'))

## Make sure we have git
if ((Get-Command -Type Application -ErrorAction SilentlyContinue git) -eq $null) 
{
  Write-Host "Please install git first"
}

## Install homepshick
## if ($IsWindows) { $home = $env:USERPROFILE }
git clone https://github.com/KitKat31337/homepsick.git "$([IO.Path]::Combine($home, ".homesick", "repos", "homepsick"))"
Import-Module -Name "$([IO.Path]::Combine($home, ".homesick", "repos", "homepsick", "src", "Homepsick.psm1"))" -Force

## clone home
New-HomepsickCastle -Clone -GitUrl https://github.com/NikoSteph/dotfiles.git
## git -C "$home/.homesick/repos/dotfiles" remote set-url origin git@stash.firekitten.net:kittyfangs/dotfiles

## Link everything
Enable-HomepsickCastle -All -Force

# Install Terminal-Icons Module
Install-Module -Name Terminal-Icons -Force

# Init Starship
Invoke-Expression (&starship init powershell)