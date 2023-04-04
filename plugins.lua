-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Shows git diff on the side
  use {
    'lewis6991/gitsigns.nvim',
    -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function()
      require('gitsigns').setup()
    end
  }

  -- Auto-closing brackets on enter({})
  use 'rstacruz/vim-closer'

  -- Highlights matching brackets({} if else end)
  use {'andymass/vim-matchup'}

  -- Commenting(gcc)
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  -- Syntax checker
  use {'dense-analysis/ale'}

  -- Tree view
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {}
    end
  }

  -- My color scheme
  use {'rustamagasanov/color-schemes'}

  -- My status line
  use {'rustamagasanov/vim-airline'}
end)
