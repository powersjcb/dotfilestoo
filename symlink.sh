#!bin/bash
# run this script in ~/dotfiles/

sh .gitaliases.sh

SOURCEDIR=$PWD
TARGETDIR=$(dirname $PWD)
IFS=$'\n'

LINKED_FILES=".zshrc
.tmux.conf
.vimrc
.ideavimrc
.global_requirements.txt
scripts.sh"

link_to_home() {
    echo "Linking $1:"
    {
        ln -sf $SOURCEDIR/$1 $TARGETDIR/$1
    } || {
        echo "Failed to create link for: $1"
    }
}

echo $LINKED_FILES

for file_name in $LINKED_FILES; do
    link_to_home $file_name
done
