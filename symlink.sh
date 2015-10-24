#!bin/bash
# run this script in ~/dotfiles/

sh .gitaliases.sh

SOURCEDIR=$PWD
TARGETDIR=$(dirname $PWD)

ln -sf $SOURCEDIR/.tmux.conf $TARGETDIR/.tmux.conf
ln -sf $SOURCEDIR/.vimrc $TARGETDIR/.vimrc

