" Colorscheme

let base16colorspace=256
syntax on
colorscheme base16-google-dark
" Python syntax
let python_highlight_all = 1
" Spaces; not tabs
set expandtab
set shiftwidth=2
set tabstop=4
" Searching
map <space> /
map <c-space> ?
" Always show status line
set laststatus=2

" Show line numbers
set number

" Show relative line numbers
set relativenumber

" Remap Ctrl+C to copy to system clipboard
vnoremap <C-c> "+y

" Delete trailing white space on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

if has("autocmd")
    autocmd BufWritePre *.txt,*.py,*.js,*.sh :call CleanExtraSpaces()
endif

call plug#begin('~/.vim/plugged')
  Plug 'JuliaEditorSupport/julia-vim'
call plug#end()
