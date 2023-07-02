#!/bin/bash -eu
TARGET=https://github.com/kkuehler/dotfiles.git
DEST="$HOME/dotfiles"

if [ ! -d "$DEST" ]; then
    git clone "$TARGET" "$DEST"
    git remote add ssh git@github.com:keur/dotfiles.git
    cd "$DEST"
else
    cd "$DEST"
    git pull origin master
fi

./install
scripts/ocf.sh
cd ..

echo
echo "Installing vim plugins..."
vim +PluginInstall +qall
echo
