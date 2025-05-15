#! /bin/bash
SCRIPT_DIR="$(dirname -- "$0")"
SRC=$SCRIPT_DIR/../.vim/manual_plugins/vim-plug/plug.vim
DEST=~/.vim/autoload/

mkdir -p $DEST && cp -r $SRC $DEST
echo "Deployed Script to $(dirname -- ~/.vim/autoload/plug.vim)"
