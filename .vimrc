let mapleader="\<space>"
syntax on
set nocompatible "The order of this makes difference"
set number
set relativenumber
set cursorcolumn "highlight column"
set wrap
set cursorline 
set showmatch    "parentheses match"
set ruler
set wildmenu
set showcmd
set laststatus=2

"tab setting"
set ts=4
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set list
set listchars=tab:>-,trail:-

"Search"
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase "no case sensitivity"
set smartcase

filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
"set mouse=a"
set encoding=utf-8
let &t_ut=''
set foldlevel=99
set autochdir
set laststatus=2
set indentexpr=
set backspace=indent,eol,start
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"different cursor mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"mapping
map R :source $MYVIMRC<CR>
map ; :
map s <nop>
inoremap jj <esc>
noremap r :call CompileRunGcc()<CR>
function! CompileRunGcc() " ! compels to redefine the function that already exists
  execute "w"
  if &filetype=='c'
    if !isdirectory('build')
     "! indicates that the following command can be excuted outside of the vim
      execute "!mkdir build" 
    endif
    execute "!gcc % -o build/%<"
    execute "!echo '----------------------------------------------'"
    execute "!time ./build/%<"
  endif
endfunction


func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
" 将tab键绑定为跳出括号
:inoremap <TAB> <c-r>=SkipPair()<CR>

"plug
call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"Auto pairs
Plug 'jiangmiao/auto-pairs' 
"About surroundings' operation.
Plug 'tpope/vim-surround'
call plug#end()

let g:airline_theme='light'

let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
