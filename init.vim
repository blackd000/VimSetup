" put some plugins
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'https://github.com/tpope/vim-commentary.git'
Plug 'jiangmiao/auto-pairs' " enable auto close stuff
Plug 'https://github.com/frazrepo/vim-rainbow.git' " highlight braces
" Plug 'drewtempelmeyer/palenight.vim' " enable theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'https://github.com/vim-airline/vim-airline.git' " enable airline

call plug#end()

let g:rainbow_active = 1

" " manualy set up
" :set background=dark
" :colorscheme palenight
" Vim Script
:colorscheme tokyonight
" set theme to true color, the color of the terminal in vim suck fuck
if (has("termguicolors"))
  set termguicolors
endif

let g:airline_theme = "tokyonight"

:set number
:set tabstop=2
:set shiftwidth=2
:set wrap linebreak
:syntax on

" Java
let java_highlight_functions = 1
let java_highlight_all = 1
let java_highlight_java = 1
let java_highlight_java_lang = 1
let java_highlight_debug = 1

" nerd tree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Shortut
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Start NERDTree and put the cursor back in the other window.
autocmd VimEnter * NERDTree | wincmd p
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif
" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" compile c/c++ program
nnoremap <f6> <esc>:!gcc -o %:r %:t<enter>
nnoremap <f7> <esc>:!g++ -std=c++14 -o %:r %:t<enter>
" run c/c++
nnoremap <f8> <esc>:!./%:r<enter>

" compile java program
nnoremap <f3> <esc>:!javac %:t<enter>
" run java
nnoremap <f4> <esc>:!java %:r <esc>:!rm *class <enter>
