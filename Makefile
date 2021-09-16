SHELL := bash

.PHONY: all
all: dotfiles ## Installs the bin and etc directory files and the dotfiles.

.PHONY: dotfiles
dotfiles: ## Installs the dotfiles.
	ln -fs $(CURDIR) $(HOME)/.dotfiles;
	ln -fs $(CURDIR)/.gitconfig $(HOME)/.gitconfig;
	ln -fs $(CURDIR)/.gitignore_global $(HOME)/.gitignore;
	ln -fs $(CURDIR)/.tmux.conf $(HOME)/.tmux.conf;
	ln -fs $(CURDIR)/.vimrc $(HOME)/.vimrc;
	ln -fs $(CURDIR)/.zshrc $(HOME)/.zshrc;

.PHONY: help
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
