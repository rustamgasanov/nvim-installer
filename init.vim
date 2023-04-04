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

" Setup status line and tabs
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1 " Automatically displays all buffers when there's only one tab open.
" On save, remove trailing lines and whitespaces(or use :ALEFix)
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

" Key mappings
" Set space as <Leader>
nnoremap <SPACE> <Nop>
let mapleader=" "
map <Leader><Leader> :NvimTreeToggle<CR>

" Colorscheme
try
  colorscheme base16-railscasts
catch
  colorscheme default
endtry

" 0 lightblack main background
" 1 red #e35f48
" 2 green #b3ca73 or #b3cb73
" 3 yellow #ffcf7f
" 4 blue #7eacc9
" 9 orange
" 10 green
" 11 yellow
" 12 13 white
" 16 black #383838
" 236 black behind line numbers
" 237 grey, line numbers
" 240 grey line numbers
" magenta #c3c2ef
" cyan #60ab62
" white #ebe6e2
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight IncSearch    ctermbg=196 ctermfg=236
highlight Search       ctermbg=9   ctermfg=236
highlight Visual       ctermbg=9   ctermfg=236
