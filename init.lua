require('plugins')

-- <Space> is <Leader>
vim.g.mapleader = " "

-- Main config
vim.opt.clipboard = "unnamed" -- yank goes to clipboard
vim.opt.number = true -- display line numbers
vim.opt.autoindent = true -- copy indent from prev line
vim.opt.tabstop = 2 -- set tab to 2 spaces
vim.opt.shiftwidth = 2 -- set '>>' and '<<' spacing indent
vim.opt.ignorecase = true -- ignore case in search
vim.opt.hlsearch = true -- highlight all search matches
vim.opt.smartcase = true -- pay attention to case when caps are used
vim.opt.incsearch = true -- show search results as I type
vim.opt.ttimeoutlen = 100 -- decrease timeout for faster insert with 'O'
vim.opt.ruler = true -- show row and column in footer
vim.opt.scrolloff = 2 -- minimum lines above/below cursor
vim.opt.laststatus = 2 -- always show status bar
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.listchars = "tab:»·,nbsp:·,trail:·,extends:>,precedes:<"
vim.opt.list = true -- display unprintable characters

function map(mode, shortcut, command)
  vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true })
end

function nmap(shortcut, command)
  map("n", shortcut, command)
end

function imap(shortcut, command)
  map("i", shortcut, command)
end

function vmap(shortcut, command)
  map("v", shortcut, command)
end

function cmap(shortcut, command)
  map("c", shortcut, command)
end

function tmap(shortcut, command)
  map("t", shortcut, command)
end

-- Mappings
-- <Space> + <Space> = NvimTree
nmap("<Leader><Leader>", ":NvimTreeToggle<CR>")
-- <Space> + <f>     = Telescope search
nmap("<Leader>f", "<CMD>Telescope find_files<CR>")
-- <Ctrl> + <\>      = Open console
require("toggleterm").setup{ direction = "horizontal", size = 15, open_mapping = [[<C-\>]] }
-- <Ctrl> + <key>    = Navigate LSP items
-- <Tab>             = Confirm LSP suggestion
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
cmp.setup({
  mapping = {
    -- Navigate between completion item
    ['<C-k>'] = cmp.mapping.select_prev_item(),
    ['<C-j>'] = cmp.mapping.select_next_item(),
    -- toggle completion
    ['<C-u>'] = cmp_action.toggle_completion(),
    -- navigate between snippet placeholder
    ['<C-a>'] = cmp_action.luasnip_jump_backward(),
    ['<C-d>'] = cmp_action.luasnip_jump_forward(),
    -- Confirm item
    ['<Tab>'] = cmp.mapping.confirm({select = true}),
  }
})

-- Colorscheme
vim.cmd("colorscheme tokyonight-storm")

-- LSP
local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  -- Replace these with whatever servers you want to install
  'gopls',
  'solargraph',
})

-- (Optional) Configure lua language server for neovim
-- require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

lsp.setup()

-- Go
-- Auto-fix imports
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = '*.go',
  callback = function()
    vim.lsp.buf.code_action({ context = { only = { 'source.organizeImports' } }, apply = true })
  end
})
