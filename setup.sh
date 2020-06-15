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

brewCaskApps=(iterm2 spectacle)
brew cask install --force --appdir=/Applications ${brewCaskApps[@]}

brew install go
brew install moreutils
brew install findutils
brew install gnu-tar
brew install gnu-sed
brew install grep
brew install gzip
brew install watch
brew install wdiff
brew install wget
brew install htop

brew install zsh
brew install thefuck

brew install zsh-history-substring-search

brew install fzf

brew install automake
brew install autoconf

brew install file-formula
brew install git

brew install rsync
brew install asdf
brew install direnv
brew install tmux
brew install vim
brew install kubectl

if [[ ! -d "${HOME}/.oh-my-zsh/" ]]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
fi

if [[ ! -x "${HOME}/.vim/bundle/Vundle.vim" ]]; then
    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
fi

if [[ ! -f "${HOME}/.colors/material-design-colors.itermcolors" ]]; then
    mkdir -p $HOME/.colors
    wget -O $HOME/.colors/material.itermcolors https://raw.githubusercontent.com/kaicataldo/material.vim/master/terminal-colors/iterm2/material.itermcolors
fi
