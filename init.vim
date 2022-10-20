call plug#begin()

Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs' " enable auto close stuff
Plug 'luochen1990/rainbow' " highlight braces
Plug 'preservim/nerdtree'

call plug#end()

let g:rainbow_active = 1
" this is only for windows
let g:clipboard = { 
			\   'name': 'wslclipboard',
			\   'copy': {
			\      '+': '/mnt/c/Users/Administrator/Documents/OtherStuff/win32yank-x64/win32yank.exe -i --crlf',
			\      '*': '/mnt/c/Users/Administrator/Documents/OtherStuff/win32yank-x64/win32yank.exe -i --crlf',
			\    },
			\   'paste': {
			\      '+': '/mnt/c/Users/Administrator/Documents/OtherStuff/win32yank-x64/win32yank.exe -o --lf',
			\      '*': '/mnt/c/Users/Administrator/Documents/OtherStuff/win32yank-x64/win32yank.exe -o --lf',
			\   },
			\   'cache_enabled': 1,
			\ }

:set number
:set tabstop=2
:set shiftwidth=2
:set wrap linebreak
:set nohls
:syntax enable
:set mouse=a

:set splitbelow

hi MatchParen cterm=underline ctermbg=none ctermfg=none

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" map some stuffs
nnoremap <C-t> :NERDTree<CR>
" nnoremap <f5> :vsplit <esc>:term g++ -std=c++17 -o %:r.out %:t && ./%:r.out && rm *.out<enter>
" nnoremap <f5> :split <esc>:term g++ -o %:r.out %:t && ./%:r.out && rm *.out<enter>
nnoremap <f5> :split <esc>:term gcc -o %:r.out %:t && ./%:r.out && rm *.out<enter>

vnoremap <C-c> "+y
map <C-v> "+p

map  <C-l> :tabn<CR>
map  <C-h> :tabp<CR>
map  <C-n> :tabnew<CR>
