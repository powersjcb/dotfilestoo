#!/bin/bash
TIME=$(date +%s)
TEMP_DIR=$HOME/temp/$TIME

mkdir cd $TEMP_DIR
trap "echo 'Removing temp directory'; rm -rf $TEMP_DIR;" EXIT


# Download zsh
wget -O $TEMP_DIR/zsh-5.2.tar.gz http://sourceforge.net/projects/zsh/files/zsh/5.2/zsh-5.2.tar.gz/download
wget -O $TEMP_DIR/zsh-5.2.tar.gz.asc http://sourceforge.net/projects/zsh/files/zsh/5.2/zsh-5.2.tar.gz.asc/download

# Validate authenticity
gpg --keyserver pgp.mit.edu --recv-key 4BDB27B3
gpg $TEMP_DIR/zsh-5.2.tar.gz.asc
echo $(gpg $TEMP_DIR/zsh-5.2.tar.gz.asc)
if [ $? != "0" ]
then
    exit 1
fi


