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
#prompt elite2 magenta


#ssh-add $HOME/.ssh/droplet_rsa
#ssh-add $HOME/.ssh/aws_developer_rsa
ssh-add $HOME/.ssh/github_rsa
ssh-add $HOME/.ssh/pg1_rsa
ssh-add $HOME/.ssh/id_rsa
ssh-add $HOME/.ssh/ttam-shared

#eval $(dinghy env)

#if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="$HOME/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$(which flake8):$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$PATH:$HOME/Library/Android/sdk/platform-tools"

export EDITOR=vim

eval "$(thefuck --alias)"

bindkey -M vicmd '?' history-incremental-search-backward

alias gf="git fetch --all --prune"
alias prestart="VAGRANT_CWD=$HOME/23andme/product/ vagrant ssh -c 'supervisorctl restart all'"
alias dc="docker-compose"
alias pyconda="export PATH=$HOME/conda/anaconda/bin:$PATH"
alias ctags="`brew --prefix`/bin/ctags"
alias srcv=". venv/bin/activate || . ve/bin/activate"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias product.master="ssh ttam@product.master.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias product.develop="ssh ttam@product.develop.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias product.rkt="ssh ttam@product.researchkit.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"

alias gpf="git push -f"
alias gs="git status"
alias gl="git log --pretty="tformat:%h %Cblue%ad%Creset %ae %Cgreen%s%Creset""
