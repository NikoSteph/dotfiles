#!/usr/bin/env bash
set -ex

# This file and this entire repo began modeled after https://github.com/onlyhavecans/dotfiles

# Do a curlbash to allow me to take over your system
# curl -sL https://raw.githubusercontent.com/NikoSteph/dotfiles/main/init.sh | bash

## Make sure we have git
for app in git curl; do
  if ! command -v "$app" &>/dev/null; then
    echo "Please install $app first"
    exit 1
  fi
done

## Install homeshick
git clone https://github.com/andsens/homeshick.git "$HOME/.homesick/repos/homeshick"
# shellcheck source=/dev/null
source "$HOME/.homesick/repos/homeshick/homeshick.sh"
source $HOME/.homesick/repos/homeshick/completions/homeshick-completion.bash

## clone home, then set it to ssh afterwards
## This means we need our keys before we can make further actions - disable the ssh behavior for now
homeshick --batch clone https://github.com/NikoSteph/dotfiles.git
## git -C "$HOME/.homesick/repos/dotfiles" remote set-url origin git@stash.firekitten.net:kittyfangs/dotfiles

## Link everything
homeshick link --force

# Init Starship
eval "$(starship init bash)"