lua require('plugins')

" Main config
set clipboard=unnamed " yank goes to clipboard
set number " display line numbers
set autoindent " copy indent from prev line
set tabstop=2 " set tab to 2 spaces
set shiftwidth=2 " set '>>' and '<<' spacing indent
set ignorecase " ignore case in search
set hlsearch " highlight all search matches
set smartcase " pay attention to case when caps are used
set incsearch " show search results as I type
set ttimeoutlen=100 " decrease timeout for faster insert with 'O'
set ruler " show row and column in footer
set scrolloff=2 " minimum lines above/below cursor
set laststatus=2 " always show status bar
set expandtab " use spaces instead of tabs
set listchars=tab:»·,nbsp:·,trail:·,extends:>,precedes:<
set list " display unprintable characters

" On save, remove trailing lines and whitespaces(or use :ALEFix)
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

" Key mappings
" Set space as <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" "
map <Leader><Leader> :NvimTreeToggle<CR>
nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>

colorscheme tokyonight-storm
