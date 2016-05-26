#!bin/bash
# run this script in ~/dotfiles/

sh .gitaliases.sh

SOURCEDIR=$PWD
TARGETDIR=$(dirname $PWD)
IFS=$'\n'

LINKED_FILES=".zshrc
.tmux.conf
.ctags
.vimrc
.ideavimrc
.global_requirements.txt
scripts.sh"

link_to() {
    echo "Linking $1:"
    {
        ln -sf $SOURCEDIR/$1 $2/$1
    } || {
        echo "Failed to create link for: $1"
    }
}

echo $LINKED_FILES

for file_name in $LINKED_FILES; do
    link_to $file_name $TARGETDIR
done

link_to "flake8" "$TARGETDIR/.config/"

