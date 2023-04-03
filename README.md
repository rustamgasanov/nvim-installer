# Neovim installer

Neovim installer for MacOS that supports `go` and `ruby`.

## Usage

To list the available commands type:

```bash
$ make
install              Install and configure neovim
remove               Remove distribution
upgrade              Upgrade distribution
```

Running `make install` will provision the neovim with a set of plugins.

This neovim distribution uses Powerline fonts. To get the Powerline font and color scheme check out [my dot-files](https://github.com/rustamagasanov/dot-files)

## Plugins list

  -  [tomtom/tcomment_vim](https://github.com/tomtom/tcomment_vim) - Commenting features(gc, gcc, etc)
  -  [msanders/snipmate](https://github.com/msanders/snipmate.vim) - Textmate snippets features (<tab> autocomplete)
  -  [scrooloose/syntastic](https://github.com/scrooloose/syntastic) - Syntax checker
  -  [leshill/vim-json](https://github.com/leshill/vim-json) - JSON syntax highlighter
  -  [rustamagasanov/color-schemes](https://github.com/rustamagasanov/color-schemes) - Base16-railscasts(used) and other color schemas
  -  [scrooloose/nerdtree](https://github.com/scrooloose/nerdtree) - Tree view support(:NERDTree)
  -  [scrooloose/nerdtree](https://github.com/kien/ctrlp.vim) - ctrl+p file search
  -  [othree/html5.vim](https://github.com/othree/html5.vim) - HTML5 syntax highlighter
  -  [elixir-lang/vim-elixir](https://github.com/elixir-lang/vim-elixir) - Elixir support

