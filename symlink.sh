#!/usr/bin/env bash
# run this script in ~/dotfiles/

IFS=$'\n'

LINKED_FILES=".zshrc
.tmux.conf
.ctags
.vimrc
.ideavimrc
.global_requirements.txt
alias.sh
scripts.sh
.gitconfig
.gitignore"

link_to() {
    echo "Linking $1:"
    {
        ln -sf $HOME/dotfiles/$1 $2/$1
    } || {
        echo "Failed to create link for: $1"
    }
}

echo $LINKED_FILES

for file_name in $LINKED_FILES; do
    link_to $file_name $HOME
done

link_to "flake8" "$HOME/.config/"

