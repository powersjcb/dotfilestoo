if [ -s $HOME/.bash_profile ]; then
    source $HOME/.bash_profile
elif [ -s $HOME/.bashrc ]; then
    source $HOME/.bashrc
elif [ -s $HOME/.bash/.bash_profile ]; then
    source $HOME/.bashrc
else
    echo "couldn't find shell profile"
fi

plugins=(git ssh-agent)

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
    source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

autoload -Uz promptinit
promptinit
prompt steeef

defaults write com.apple.finder AppleShowAllFiles YES

#ssh-add $HOME/.ssh/droplet_rsa
#ssh-add $HOME/.ssh/aws_developer_rsa
ssh-add $HOME/.ssh/github_rsa
ssh-add $HOME/.ssh/pg1_rsa
ssh-add $HOME/.ssh/id_rsa
ssh-add $HOME/.ssh/ttam-shared


mkdir -p $HOME/go/bin
export _GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$_GOROOT/bin
export NVM_DIR="$HOME/.nvm"
export PATH="$PYENV_ROOT/bin:$PATH"
#export PATH="$(which flake8):$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"

export P4USER=jpowers
export EDITOR=vim
export AWS_DEFAULT_PROFILE=default
export profile=$AWS_DEFAULT_PROFILE

eval "$(thefuck --alias)"

bindkey -M vicmd '?' history-incremental-search-backward

alias ....="cd ../../.."
alias ...="cd ../.."
alias ..="cd .."
alias ctags="`brew --prefix`/bin/ctags"
alias dc="docker-compose"
alias prestart="VAGRANT_CWD=$HOME/23andme/product/ vagrant ssh -c 'supervisorctl restart all'"
alias product.develop="ssh ttam@product.develop.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias product.master="ssh ttam@product.master.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias pyconda="export PATH=$HOME/conda/anaconda/bin:$PATH"
alias srcv=". venv/bin/activate || . ve/bin/activate"
alias setgo="export GOPATH=\`pwd\` && export PATH=\$PATH:\$GOPATH/bin"

