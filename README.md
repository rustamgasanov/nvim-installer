# Neovim installer

Neovim installer for developing in `go` and `ruby`.

## Usage

To list the available commands type:

```bash
$ make
install              Install neovim, packer, plugins
remove               Remove distribution
```

Running `make install` will install or upgrade neovim with plugins.

NOTE: [Nerd font](https://www.nerdfonts.com/) is required to properly display `NvimTree` icons and `Status Line`, check [my dot-files](https://github.com/rustamagasanov/dot-files) for instructions.

## Installed files location

- `~/.local/share/nvim/site/pack/packer/start/packer.nvim` - *Packer*
- `~/.local/share/nvim/site/pack/packer/` - Packer plugins
- `~/.config/nvim/lua/plugins.lua` - symlink, *plugins list* and configuration
- `~/.config/nvim/init.vim` - symlink, vim configuration

## Extending

See https://github.com/rockerBOO/awesome-neovim
