## If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Override OSX Langugage of en_CA with en_US
export LANG=en_US.utf-8

# Add android dev stuff
export PATH=${PATH}:/Users/lwaite/Library/Android/sdk/platform-tools:/Users/lwaite/Library/Android/sdk/tools:/Users/lwaite/Library/Android/sdk/cmdline-tools/latest/bin

#### START ZSH / ANTIGEN SETUP ###
source ~/.dotfiles/antigen.zsh

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

autoload -U add-zsh-hook


# Init artisan completion
source $HOME/.dotfiles/plugins/laravel

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/bin:$PATH"

. $HOME/.asdf/asdf.sh

. "/Users/lwaite/.acme.sh/acme.sh.env"

for file in $HOME/.dotfiles/.{profile,aliases,dockerfunc}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file
