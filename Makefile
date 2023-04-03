.DEFAULT_GOAL := help

INIT_FILE    := init.vim
PLUGINS_FILE := plugins.lua

PACKER_DIR := ~/.local/share/nvim/site/pack/packer/start/packer.nvim
PACKER_GIT := https://github.com/wbthomason/packer.nvim

INIT_FILE_DIR      := ~/.config/nvim/
PACKER_PLUGINS_DIR := ~/.config/nvim/lua/

.PHONY: help
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 $(shell echo "\t") \2/' | sort | expand -t20

.PHONY: install # Install and configure neovim
install:
	@echo "→ Installing neovim"
	brew list nvim || brew install nvim
	@echo "→ Installing packer.nvim"
	if [ ! -d $(PACKER_DIR) ] ; then\
		git clone --depth 1 $(PACKER_GIT) $(PACKER_DIR);\
	fi
	@echo "→ Installing packer"
	mkdir -p $(PACKER_PLUGINS_DIR)
	ln -nfs $(shell pwd)/$(PLUGINS_FILE) $(PACKER_PLUGINS_DIR)$(PLUGINS_FILE)
	ln -nfs $(shell pwd)/$(INIT_FILE) $(INIT_FILE_DIR)$(INIT_FILE)
	@echo "→ Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: upgrade # Upgrade neovim and packer
upgrade:
	@echo "→ Upgrading neovim"
	brew upgrade nvim
	@echo "→ Upgrading packer"
	cd $(PACKER_DIR) && git pull $(PACKER_GIT)
	@echo "→ Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
