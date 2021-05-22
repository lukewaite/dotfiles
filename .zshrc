# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## If not in ssh, define the default user
[[ -n "$SSH_CLIENT" ]] || export DEFAULT_USER="lwaite"

# Override OSX Langugage of en_CA with en_US
export LANG=en_US.utf-8

# Add android dev stuff
export PATH=${PATH}:/Users/lwaite/Library/Android/sdk/platform-tools:/Users/lwaite/Library/Android/sdk/tools:/Users/lwaite/Library/Android/sdk/cmdline-tools/latest/bin

source $HOME/.asdf/asdf.sh
#source $HOME/.asdf/completions/asdf.bash

#### START ZSH / ANTIGEN SETUP ###
source ~/.dotfiles/antigen.zsh

antigen use oh-my-zsh

antigen bundle composer
antigen bundle docker
antigen bundle terraform
antigen bundle z

# antigen bundle $HOME/.dotfiles luke.zsh-theme --no-local-clone
antigen theme romkatv/powerlevel10k

antigen apply
#### END ZSH / ANTIGEN SETUP ###

# Load custom scripts into path
export PATH="$HOME/.dotfiles/bin:$PATH"

autoload -U add-zsh-hook


# Init artisan completion
source $HOME/.dotfiles/plugins/laravel

export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/bin:$PATH"

. "/Users/lwaite/.acme.sh/acme.sh.env"

for file in $HOME/.dotfiles/.{profile,aliases,dockerfunc}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		# shellcheck source=/dev/null
		source "$file"
	fi
done
unset file

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.dotfiles/.p10k.zsh ]] || source ~/.dotfiles/.p10k.zsh
