#! /bin/bash
SCRIPT_DIR="$(dirname -- "$0")"
DEPLOY=$1

if test -z "$DEPLOY"; then
    echo "Deploying All Dot Files to ~/"
    cp -r $SCRIPT_DIR ~/
    rm -rf ~/.git
    rm ~/deploy_dotfiles.sh
else
    echo "Deploying Subdirectory $SCRIPT_DIR/$DEPLOY to ~/../$DEPLOY"
    cp -r $SCRIPT_DIR/$DEPLOY ~/$DEPLOY/../
fi
