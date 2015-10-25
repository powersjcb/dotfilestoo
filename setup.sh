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


#ln -s "${HOME}/.zprezto/runcoms/zlogin"    "${HOME}/.zlogin"
#ln -s "${HOME}/.zprezto/runcoms/zlogout"   "${HOME}/.zlogout"
#ln -s "${HOME}/.zprezto/runcoms/zpreztorc" "${HOME}/.zpreztorc"
#ln -s "${HOME}/.zprezto/runcoms/zprofile"  "${HOME}/.zprofile"
#ln -s "${HOME}/.zprezto/runcoms/zshenv"    "${HOME}/.zshenv"
#ln -s "${HOME}/.zprezto/runcoms/zshrc"     "${HOME}/.zshrc"




