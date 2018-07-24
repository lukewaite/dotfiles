## If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Override OSX Langugage of en_CA with en_US
export LANG=en_US.utf-8

# Add the ChefDK binaries to the beginning of the PATH
#export PATH=/opt/chefdk/bin:$PATH


# Init rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

#### START ZSH / ANTIGEN SETUP ###
source ~/.dotfiles/antigen.zsh
#
antigen use oh-my-zsh

antigen bundle composer
antigen bundle docker
antigen bundle terraform
antigen bundle z

antigen bundle $HOME/.dotfiles luke.zsh-theme --no-local-clone

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

autoload -U add-zsh-hook

# Init gulp completion
eval "$(gulp --completion=zsh)"

# Init artisan completion
source $HOME/.dotfiles/plugins/laravel

export PATH="/usr/local/sbin:$PATH"

export PATH="$HOME/.yarn/bin:$PATH"

#export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn



export PATH="/usr/local/opt/python/libexec/bin:$PATH"


# virtualenv
#export WORKON_HOME=~/virtualenvs
#source /usr/local/bin/virtualenvwrapper.sh

export PATH="/usr/local/bin:$PATH"



. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash
