PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt steeef

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
export PATH="$HOME/.rbenv/bin:$PATH"



eval "$(rbenv init -)"

export EDITOR=vim

eval "$(thefuck --alias)"

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

