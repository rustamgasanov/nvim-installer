lua require('plugins')

" Main config
set clipboard=unnamed "yank goes to clipboard

" On save, remove trailing lines and whitespaces(or use :ALEFix)
let g:ale_fixers = { '*': ['remove_trailing_lines', 'trim_whitespace'] }
let g:ale_fix_on_save = 1

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
