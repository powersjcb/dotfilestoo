#!/bin/bash
TIME=$(date +%s)
mkdir -p $HOME/tmp
TEMP_DIR=$HOME/tmp/$TIME

mkdir $TEMP_DIR
trap "echo 'Removing temp directory'; rm -rf $TEMP_DIR;" EXIT


# Download and install zsh
wget -O $TEMP_DIR/zsh-5.2.tar.gz http://sourceforge.net/projects/zsh/files/zsh/5.2/zsh-5.2.tar.gz/download
tar -zxvf $TEMP_DIR/zsh-5.2.tar.gz

# put everything inside of temp dir to be symlinked when done
LOCAL_DIR=$TEMP_DIR/local/
mkdir $LOCAL_DIR

cd zsh-5.2
./configure --prefix=$LOCAL_DIR
make && make test && make install

chsh -s $LOCAL_DIR/bin/zsh

# Install rbenv and then ruby 2.2.2
git clone --depth 1 https://github.com/rbenv/rbenv.git $TEMP_DIR/.rbenv

# Download and install newest vim

git clone --depth 1 https://github.com/vim/vim.git
cd vim
./configure --with-features=huge \
    --enable-multibyte \
    --enable-rubyinterp \
    --enable-pythoninterp \
    --enable-perlinterp \
    --enable-rubyinterp \
    --enable-luainterp \
    --enable-gui=gtk2 --enable-cscope --prefix=/usr
make VIMRUNTIMEDIR=/usr/share/vim/vim74
sudo make install

ln -s $LOCAL_DIR/* $HOME/
