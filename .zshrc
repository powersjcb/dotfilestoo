if [ -s "$HOME/.bash_profile"]; then
    source $HOME/.bash_profile
elif [ -s "$HOME/.bashrc"]; then
    source $HOME/.bashrc
else
    echo "couldn't find shell profile"
    exit 1
fi

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

ssh-add $HOME/.ssh/pg1_rsa
ssh-add $HOME/.ssh/github_rsa
ssh-add $HOME/.ssh/id_rsa

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export NVM_DIR="/Users/jpowers/.nvm"
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PATH="$(which flake8):$PATH"
export PATH="$PATH:./node_modules/.bin"
export PATH="$HOME/.rbenv/shims:$PATH"
export PATH="$HOME/.jenv/bin:$PATH"

export EDITOR=vim

[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(pyenv virtualenv-init -)"
eval "$(jenv init -)"
eval "$(thefuck --alias)"

bindkey -M vicmd '?' history-incremental-search-backward
