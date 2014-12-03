[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

export PATH=/opt/chefdk/bin:$PATH

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

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

antigen theme https://gist.github.com/lukewaite/883b8b92b327c6fd2bd4 agnoster

antigen apply

# npm and other tools write their inits into .profile, so we will load it if it's there
if [ -f "$HOME/.profile" ]; then
    . "$HOME/.profile"
fi
