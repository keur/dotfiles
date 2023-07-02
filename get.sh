#!/bin/bash -eu
TARGET=https://github.com/keur/dotfiles.git
DEST="$HOME/dotfiles"

if [ ! -d "$DEST" ]; then
    git clone "$TARGET" "$DEST"
    git remote add ssh git@github.com:keur/dotfiles.git
    cd "$DEST"
else
    cd "$DEST"
    if [[ -z $(git status -s) ]]; then
      git pull origin master
    fi
fi

./install

command -v nvim >/dev/null 2>&1
if [[ $? -eq 0 ]]; then
  echo "Installing neovim plugins!"
  nvim --headless +PluginInstall +qall
fi
