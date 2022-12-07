#!/bin/bash
set -e

BIN_DIR=$HOME/.local/bin
VIM_PLUGINS_DIR=$HOME/.vim/plugins
SHELL_PROFILE=$HOME/.profile
#$HOME/.bash_profile # macOS?

while getopts "g" opt; do
    case $opt in
        g)
            BIN_DIR=/usr/local/bin
            VIM_PLUGINS_DIR=/etc/vim/plugins
            SHELL_PROFILE=/etc/profile
            ;;
    esac
done

# Check whether `vimpager` exists on your $PATH:
# If it does not, copy `vimpager` to a directory on your $PATH:
which vimpager || cp vimpager $BIN_DIR

# Create less plugin for vim
cp less.vim $VIM_PLUGINS_DIR

# Configure `psql` to use `vimpager` as its pager by default:
cat << EOF >> $SHELL_PROFILE

if [[ ! -z \`which vimpager\` ]]; then
    alias psql='PAGER=vimpager psql';
fi
EOF
