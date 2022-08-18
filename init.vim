call plug#begin()

Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs' " enable auto close stuff
Plug 'luochen1990/rainbow' " highlight braces

call plug#end()

let g:rainbow_active = 1

:set number
:set tabstop=2
:set shiftwidth=2
:set wrap linebreak
:set nohls
:syntax enable
:set mouse=a

hi MatchParen cterm=underline ctermbg=none ctermfg=none

nnoremap <f5> <esc>:term g++ -std=c++14 -o %:r %:t && ./%:r<enter>
