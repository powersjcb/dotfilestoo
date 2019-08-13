#!/usr/bin/env bash

#### must manually install xcode cli tools first ####
# xcode-select –-install


### brew installations ####
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
./symlink.sh

brew update
brew doctor

brew tap phinze/cask
brew install brew-cask

brewCaskApps=(iterm2 firefox)
brew cask install --force --appdir=/Applications ${brewCaskApps[@]}

brew install moreutils
brew install findutils --with-default-names
brew install gnu-tar --with-default-names
brew install gnu-sed --with-default-names
brew install grep --with-default-names
brew install gzip
brew install watch
brew install wdiff --with-gettext
brew install wget
brew install htop

brew install zsh
brew install thefuck

brew install automake
brew install autoconf

brew install file-formula
brew install git

brew install rsync
brew install asdf
brew install tmux
brew install vim

# if [[ ! -x "${HOME}/.tmux" ]]; then
#     # try installing tmux
#     {
#         git clone --depth=1 https://github.com/tmux/tmux.git "${HOME}/.tmux/"
#         cd $HOME/.tmux/
#         sh autogen.sh
#         ./configure && make && sudo make install
#     } || {
#         echo "something went wrong while building or installing tmux"
#     }
#     # always return to $HOME
#     cd $HOME
# fi

#if [[ ! -x "${HOME}/.zprezto" ]]; then
#    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${HOME}/.zprezto"
#else
#    cd $HOME/.zprezto
#    git checkout master
#    git pull
#fi

# TODO: fix this, its broken
#shopt -s extglob
#for rcfile in $HOME/.zprezto/runcoms/; do
#    ln -s "$rcfile" "${HOME}/.$(basename $rcfile)" | echo "$rcfile already exists"
#done

if [[ -x "${HOME}/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
fi
