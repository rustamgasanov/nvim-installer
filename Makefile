.DEFAULT_GOAL := help

INIT_FILE    := init.vim
PLUGINS_FILE := plugins.lua

NVIM_LOCAL_SHARE_DIR := ~/.local/share/nvim
NVIM_CONFIG_DIR      := ~/.config/nvim
PACKER_CONFIG_DIR    := $(NVIM_CONFIG_DIR)/lua

# Plugins will be installed under ~/.local/share/nvim/site/pack/packer/start
PACKER_DIR := $(NVIM_LOCAL_SHARE_DIR)/site/pack/packer/start/packer.nvim
PACKER_GIT := https://github.com/wbthomason/packer.nvim

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
	mkdir -p $(PACKER_CONFIG_DIR)
	ln -nfs $(shell pwd)/$(PLUGINS_FILE) $(PACKER_CONFIG_DIR)/$(PLUGINS_FILE)
	ln -nfs $(shell pwd)/$(INIT_FILE) $(NVIM_CONFIG_DIR)/$(INIT_FILE)
	@echo "→ Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: upgrade # Check for and install upgrades
upgrade:
	@echo "→ Upgrading neovim"
	brew upgrade nvim
	@echo "→ Upgrading packer"
	cd $(PACKER_DIR) && git pull $(PACKER_GIT)
	@echo "→ Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: remove # Remove distribution
remove:
	@echo "→ Removing neovim"
	brew uninstall nvim
	@echo "→ Removing packer and plugins"
	rm -rf $(NVIM_CONFIG_DIR)
	rm -rf $(NVIM_LOCAL_SHARE_DIR)
