DEFAULT_USER=lwaite

eval "$(chef shell-init zsh)"

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

antigen theme https://gist.github.com/agnoster/3712874 agnoster

antigen apply
