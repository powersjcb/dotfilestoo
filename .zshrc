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


#ssh-add $HOME/.ssh/droplet_rsa
#ssh-add $HOME/.ssh/aws_developer_rsa
ssh-add $HOME/.ssh/github_rsa
ssh-add $HOME/.ssh/pg1_rsa
ssh-add $HOME/.ssh/id_rsa
ssh-add $HOME/.ssh/ttam-shared

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="/Users/jpowers/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$(which flake8):$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

export EDITOR=vim

eval "$(thefuck --alias)"

bindkey -M vicmd '?' history-incremental-search-backward
alias ctags="`brew --prefix`/bin/ctags"
alias srcv="source venv/bin/activate || source ve/bin/activate"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias product.master="ssh ttam@product.master.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias product.develop="ssh ttam@product.develop.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"
alias product.rkt="ssh ttam@product.researchkit.tech.ttam.io -i ~/23andme/ansible/keys/ttam-shared"

alias gpf="git push -f"
alias gs="git status"
alias gl="git log --pretty="tformat:%h %Cblue%ad%Creset %ae %Cgreen%s%Creset""
