" put some plugins
call plug#begin()

Plug 'https://github.com/Townk/vim-autoclose.git'
Plug 'https://github.com/frazrepo/vim-rainbow.git' "highlight braces
Plug 'drewtempelmeyer/palenight.vim' "enable theme
Plug 'https://github.com/vim-airline/vim-airline.git' "enable airline
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:rainbow_active = 1

" manualy set up
:set background=dark
:colorscheme palenight
" set theme to true color, the color of the terminal in vim suck fuck
if (has("termguicolors"))
  set termguicolors
endif

:set number
:set tabstop=2
:set shiftwidth=2
:set wrap linebreak
:syntax on

" compile program
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
if &filetype == 'c'
exec "!gcc % -o %<"
exec "!time ./%<"
elseif &filetype == 'cpp'
exec "!g++ % -o %<"
exec "!time ./%<"
elseif &filetype == 'java'
exec "!javac %"
exec "!time java -cp %:p:h %:t:r"
elseif &filetype == 'sh'
exec "!time bash %"
elseif &filetype == 'python'
exec "!time python2.7 %"
elseif &filetype == 'html'
exec "!firefox % &"
elseif &filetype == 'go'
exec "!go build %<"
exec "!time go run %"
elseif &filetype == 'mkd'
exec "!~/.vim/markdown.pl % > %.html &"
exec "!firefox %.html &"
endif
endfunc
