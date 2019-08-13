PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

export ZSH=$HOME/.oh-my-zsh
export ZSH_THEME="steeef"
plugins=(git)

source $ZSH/oh-my-zsh.sh


defaults write com.apple.finder AppleShowAllFiles YES

export ARDUINO_SDK_PATH=/Applications/Arduino.app/Contents/Java

mkdir -p $HOME/go/bin
export _GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$_GOROOT/bin
export PATH=/usr/local/lib/python2.7/site-packages:$PATH
export PATH=/usr/local/lib/python3.6/site-packages:$PATH
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"
export PATH="$PATH:$ARDUINO_SDK_PATH"

export GOPATH=$HOME/go


export EDITOR=vim

eval "$(thefuck --alias)"

plugins=(
  git
  bundler
  osx
  rake
  go
)

bindkey -M vicmd '?' history-incremental-search-backward

alias lsa='ls -a'
alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias ctags="`brew --prefix`/bin/ctags"
alias dc="docker-compose"
alias pyconda="export PATH=$HOME/conda/anaconda/bin:$PATH"
alias srcv=". venv/bin/activate || . ve/bin/activate"
alias setgo="export GOPATH=\`pwd\` && export PATH=\$PATH:\$GOPATH/bin"


autoload -Uz compinit && compinit
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

eval "$(direnv hook zsh)"
