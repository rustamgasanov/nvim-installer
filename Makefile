.DEFAULT_GOAL := help

INIT_FILE    := init.vim
PLUGINS_FILE := plugins.lua

NVIM_LOCAL_SHARE_DIR := ~/.local/share/nvim
NVIM_CONFIG_DIR      := ~/.config/nvim
PACKER_CONFIG_DIR    := $(NVIM_CONFIG_DIR)/lua

PACKER_DIR := $(NVIM_LOCAL_SHARE_DIR)/site/pack/packer/start/packer.nvim
PACKER_GIT := https://github.com/wbthomason/packer.nvim

.PHONY: help
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 $(shell echo "\t") \2/' | sort | expand -t20

.PHONY: install # Install neovim, packer, plugins
install:
	@echo "→ Installing neovim"
	brew upgrade nvim || brew install nvim
	@echo "→ Installing packer.nvim"
	if [ ! -d $(PACKER_DIR) ] ; then\
		git clone --depth 1 $(PACKER_GIT) $(PACKER_DIR);\
	else\
		cd $(PACKER_DIR) && git pull $(PACKER_GIT);\
	fi
	@echo "→ Installing packer"
	mkdir -p $(PACKER_CONFIG_DIR)
	ln -nfs $(shell pwd)/$(PLUGINS_FILE) $(PACKER_CONFIG_DIR)/$(PLUGINS_FILE)
	ln -nfs $(shell pwd)/$(INIT_FILE) $(NVIM_CONFIG_DIR)/$(INIT_FILE)
	@echo "→ Installing plugins"
	nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'

.PHONY: remove # Remove distribution
remove:
	@echo "→ Removing neovim"
	brew uninstall nvim
	@echo "→ Removing packer and plugins"
	rm -rf $(NVIM_CONFIG_DIR)
	rm -rf $(NVIM_LOCAL_SHARE_DIR)
