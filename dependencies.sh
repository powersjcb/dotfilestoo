#!/bin/bash
TIME=$(date +%s)
TEMP_DIR=$HOME/temp/$TIME

mkdir cd $TEMP_DIR
trap "echo 'Removing temp directory'; rm -rf $TEMP_DIR;" EXIT


# Download and install zsh
wget -O $TEMP_DIR/zsh-5.2.tar.gz http://sourceforge.net/projects/zsh/files/zsh/5.2/zsh-5.2.tar.gz/download
tar -zxvf $TEMP_DIR/zsh-5.2.tar.gz

LOCAL_DIR=$HOME/local/
mkdir $LOCAL_DIR

cd zsh-5.2
./configure --prefix=$LOCAL_DIR
make && make test && make install

chsh -s $LOCAL_DIR/bin/zsh



