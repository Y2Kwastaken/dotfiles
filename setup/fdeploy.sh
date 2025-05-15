#! /bin/bash
SCRIPT_DIR=$(dirname -- $0)
ROOT=$SCRIPT_DIR/../
HOME=~/

DEPLOY_TYPE=$1
DEPLOY_TYPES=("hypr", "vim")

readarray EXCLUDE_VIM < $SCRIPT_DIR/deploy_exclusions/vim.exclude

if test -z "$DEPLOY_TYPE"; then
    echo "No Deploy Type Chosen Chose From [${DEPLOY_TYPES[*]}]"
    exit 1
fi

if [[ ! "${DEPLOY_TYPES[*]} =~ [[:space:]]${DEPLOY_TYPE}[[:space:]]" ]]; then
    echo "No Deploy Type Found $DEPLOY_TYPE"
    exit 1  
fi

if test $DEPLOY_TYPE = "vim"; then
    echo "Deploying Vim Configurations"
    args=""
    for exclusion in $EXCLUDE_VIM; do args+="--exclude $exclusion "; done
    len=${#args}
    args=${args::len-1}
    echo "running 'rsync -avh --progress $ROOT/.vim/ $ROOT/copied_vim/ $args'"
    exec rsync -avh --progress $ROOT/.vim/ ~/.vim/ $args
    exit 1
fi

if test $DEPLOY_TYPE = "hypr"; then
    echo "Deploying Hyprland Configurations"
    cp -r $ROOT/.config/hypr/ ~/.config/
    exit 1
fi
