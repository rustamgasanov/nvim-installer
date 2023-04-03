.DEFAULT_GOAL := help

.PHONY: help
help:
	@grep '^.PHONY: .* #' Makefile | sed 's/\.PHONY: \(.*\) # \(.*\)/\1 $(shell echo "\t") \2/' | sort | expand -t20

.PHONY: install # Install and configure neovim
install:
	@echo "→ Installing neovim"
	brew list nvim || brew install nvim
	@echo "→ Installing packer.nvim"
	git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
	mkdir ~/.config/nvim/lua/
