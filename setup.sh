#!/usr/bin/env bash

bash dependencies.sh
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
        echo "Tring to install $1";
        { which $1 >/dev/null; } && { echo "Already installed";  return; }
    } && {
        $INSTALL_METHOD install $1

    } || {
        echo "Failed to install $1"
    }
}

try_install "zsh";

if [[ ! -x "${HOME}/.zprezto" ]]; then
    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
fi

shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/!(README.md); do
    ln -s "$rcfile" "${HOME}/.$(basename $rcfile)"
done

if [[ -x "${HOME}/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
fi

generic_libraries = (
    "python-setuptools"
    "python-pip"
)

for lib in generic_libraries; do
    try_install lib
done

pip install pip -U
pip install -r $HOME/.global_requirements.txt

bash npm_which.sh
