.DEFAULT_GOAL := help

PLUGINS_FILE := plugins.lua

PACKER_DIR := ~/.local/share/nvim/site/pack/packer/start/packer.nvim
PACKER_GIT := https://github.com/wbthomason/packer.nvim

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
	@echo "→ Adding packer plugins config"
	mkdir -p $(PACKER_PLUGINS_DIR)
	ln -nfs $(shell pwd)/$(PLUGINS_FILE) $(PACKER_PLUGINS_DIR)$(PLUGINS_FILE)

.PHONY: upgrade # Upgrade neovim and packer
upgrade:
	brew upgrade nvim
	cd $(PACKER_DIR)
	git pull $(PACKER_GIT)
