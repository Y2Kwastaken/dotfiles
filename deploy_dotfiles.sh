#! /bin/bash
SCRIPT_DIR="$(dirname -- "$0")"

if test -z "$DEPLOY"; then
    echo "Deploying All Dot Files to ~/"
    cp -r $SCRIPT_DIR ~/
    rm -rf ~/.git
    rm ~/deploy_dotfiles.sh
fi
