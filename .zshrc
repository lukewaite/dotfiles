# If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Override OSX Langugage of en_CA with en_US
export LANG=en_US.utf-8

# Add the ChefDK binaries to the beginning of the PATH
export PATH=/opt/chefdk/bin:$PATH


# Init rbenv
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### START ZSH / ANTIGEN SETUP ###
source ~/.dotfiles/antigen/antigen.zsh

antigen use oh-my-zsh

antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle brew
antigen bundle bower
antigen bundle composer
antigen bundle jsontools
antigen bundle phing
antigen bundle vagrant
antigen bundle command-not-found
antigen bundle docker
antigen bundle virtualenv
antigen bundle docker
antigen bundle z
antigen bundle ~/.dotfiles/plugins/aws-keychain --no-local-clone

antigen theme https://gist.github.com/lukewaite/883b8b92b327c6fd2bd4 agnoster

antigen apply
### END ZSH / ANTIGEN SETUP ###

# Load custom scripts into path
export PATH="$HOME/.dotfiles/bin:$PATH"

# Source aliases
source $HOME/.dotfiles/.aliases

# npm and other tools write their inits into .profile, so we will load it if it's there
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh


### Are we starting where there is a virtualenv available?
virtualenv="$(pwd)/bin/activate"
if [ -e "$virtualenv" ]
then
  echo "Detected a virtualenv in the startup directory and auto-sourcing";
  source $virtualenv
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

export LAMBDASH_FUNCTION=lambdash-function-1X5SMEP41A4BY
