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
