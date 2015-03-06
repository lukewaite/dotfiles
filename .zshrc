# If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Add the ChefDK binaries to the beginning of the PATH
export PATH=/opt/chefdk/bin:$PATH

# INIT boot2docker if not in ssh
[[ -n "$SSH_CLIENT" ]] || $(boot2docker shellinit)

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

antigen theme https://gist.github.com/lukewaite/883b8b92b327c6fd2bd4 agnoster

antigen apply
### END ZSH / ANTIGEN SETUP ###

# Source aliases
source $HOME/.dotfiles/.aliases

# npm and other tools write their inits into .profile, so we will load it if it's there
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
