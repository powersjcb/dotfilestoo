#!/usr/bin/env bash

#### must manually install xcode cli tools first ####
 xcode-select –-install

 bash dependencies.sh
bash symlink.sh

### brew installations ####
ruby -e “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)”

brew update
brew doctor

brew tap phinze/cask
brew install brew-cask

brewCaskApps=(atom pycharm dropbox flux github google-chrome iterm2 vagrant vagrant-manager vmware-fusion
firefox hipchat 1password karabiner slack)
brew cask install --force --appdir=/Applications ${brewCaskApps[@]}
brew cask install hyper

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

brew install bash
brew install zsh
brew install emacs

brew install automake
brew install autoconf

brew install file-formula
brew install git

brew install openssh --with-brewed-openssl
brew install rsync
brew install svn

brew install python-setuptools
brew install python-pip
brew install python3

git clone https://github.com/rbenv/rbenv.git  $HOME/.rbenv
git -C $HOME/.rbenv checkout b943955dbf10c436a8d4c7c36fd4216a34ef2b33
$HOME/.rbenv/src/configure && make -C $HOME/.rbenv/src
rbenv install 2.4.2
rbenv global 2.4.2


if [[ ! -x "${HOME}/.tmux" ]]; then
    # try installing tmux
    {
        git clone --depth=1 https://github.com/tmux/tmux.git "${HOME}/.tmux/"
        cd $HOME/.tmux/
        sh autogen.sh
        ./configure && make && sudo make install
    } || {
        echo "something went wrong while building or installing tmux"
    }
    # always return to $HOME
    cd $HOME
fi

if [[ ! -x "${HOME}/.zprezto" ]]; then
    git clone --recursive https://github.com/powersjcb/prezto.git "${HOME}/.zprezto"
else
    cd $HOME/.zprezto
    git checkout master
    git pull
fi

shopt -s extglob
for rcfile in $HOME/.zprezto/runcoms/; do
    ln -s "$rcfile" "${HOME}/.$(basename $rcfile)" | echo "$rcfile already exists"
done

#if [[ -x "${HOME}/.vim/bundle/Vundle.vim" ]]; then
#    git clone https://github.com/gmarik/Vundle.vim.git "${HOME}/.vim/bundle/Vundle.vim"
#fi

#### install python distributions ####
#pip install pip -U
#pip install virtualenv
#virtualenv $HOME/.venv -p python3
#source $HOME/.venv/bin/activate
#pip install -r $HOME/.global_requirements.txt
