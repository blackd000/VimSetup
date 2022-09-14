call plug#begin()

Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs' " enable auto close stuff
Plug 'luochen1990/rainbow' " highlight braces
Plug 'preservim/nerdtree'

call plug#end()

let g:rainbow_active = 1

:set number
:set tabstop=2
:set shiftwidth=2
:set wrap linebreak
:set nohls
:syntax enable
:set mouse=a
:set clipboard=unnamedplus
:set splitbelow

hi MatchParen cterm=underline ctermbg=none ctermfg=none

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" map some stuffs
nnoremap <C-t> :NERDTree<CR>
" nnoremap <f5> :vsplit <esc>:term g++ -std=c++17 -o %:r.out %:t && ./%:r.out && rm *.out<enter>
nnoremap <f5> :split <esc>:term g++ -std=c++17 -o %:r.out %:t && ./%:r.out && rm *.out<enter>

vnoremap <C-c> "+y
map <C-v> "+p

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
