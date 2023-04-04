# Neovim installer

Neovim installer for MacOS that supports `go` and `ruby`.

## Usage

To list the available commands type:

```bash
$ make
install              Install neovim, packer, plugins
remove               Remove distribution
upgrade              Upgrade distribution
```

Running `make install` will provision the neovim with a set of plugins.

TODO, automate: This neovim distribution uses Powerline fonts. To get the Powerline font and color scheme check out [my dot-files](https://github.com/rustamagasanov/dot-files)

## Files location

- `~/.local/share/nvim/site/pack/packer/start/packer.nvim` - *Packer*
- `~/.local/share/nvim/site/pack/packer/` - Packer plugins
- `~/.config/nvim/lua/plugins.lua` - symlink, *plugins list* and configuration
- `~/.config/nvim/init.vim` - symlink, vim configuration
