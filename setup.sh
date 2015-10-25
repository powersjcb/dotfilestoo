#!/usr/bin/env bash


bash symlink.sh

if [[ -x "/usr/bin/apt-get" ]]; then
    echo "apt-get detected"
    INSTALL_METHOD="apt-get"
    sudo apt-get update
elif [[ -x "/usr/bin/yum" ]]; then
    echo "yum detected"
    INSTALL_METHOD="yum"
    yum check-update
elif which brew >/dev/null; then
    echo "Homebrew detected"
    INSTALL_METHOD="brew"
    brew update
else
    echo "could not find installer"
    exit 1 
fi

try_install () {
    {
        echo "Tring to install $1"
        { which $1 >/dev/null } && { echo "Already installed";  return; }
    } && {
        $INSTALL_METHOD install $1

    } || {
        echo "Failed to install $1"
    }
}

try_install "zsh"

echo "Switching to zsh"
exec zsh

git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

setopt EXTENDED_GLOB
for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
    ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
done

zsh

