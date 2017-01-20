## If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Override OSX Langugage of en_CA with en_US
export LANG=en_US.utf-8

# Add the ChefDK binaries to the beginning of the PATH
#export PATH=/opt/chefdk/bin:$PATH


# Init rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### START ZSH / ANTIGEN SETUP ###
source ~/.dotfiles/antigen/antigen.zsh
#
antigen use oh-my-zsh

antigen bundle composer
antigen bundle docker
antigen bundle z

antigen theme https://gist.github.com/lukewaite/883b8b92b327c6fd2bd4 agnoster

antigen apply
#### END ZSH / ANTIGEN SETUP ###

# Load custom scripts into path
export PATH="$HOME/.dotfiles/bin:$PATH"

# Source aliases
source $HOME/.dotfiles/.aliases

# npm and other tools write their inits into .profile, so we will load it if it's there
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

autoload -U add-zsh-hook
load-nvmrc() {
  if [[ -f .nvmrc && -r .nvmrc ]]; then
    nvm use
  fi
}
add-zsh-hook chpwd load-nvmrc

# Init gulp completion
eval "$(gulp --completion=zsh)"

# Init artisan completion
source $HOME/.dotfiles/plugins/laravel

export PATH="/usr/local/sbin:$PATH"
