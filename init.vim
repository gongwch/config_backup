let mapleader=" "
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
set hidden

"tab setting"
set ts=4
set expandtab
set tabstop=2
set shiftwidth=4
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
set guicursor=i-ci:ver30-iCursor-blinkwait300-blinkon200-blinkoff150
"set guicursor=n:nCursor-blinkwait300-blinkon600-blinkoff150
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"different cursor mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"


"mapping
map R :source $MYVIMRC<CR>
map W :w <CR>
map ; :
"map s <nop>
noremap <LEADER>rc :e ~/.config/nvim/init.vim<CR>

" Indentation
nnoremap < <<
nnoremap > >>

" N key: go to the start of the line
noremap <silent> , 0
" I key: go to the end of the line
noremap <silent> . $

"inoremap jj <esc>
noremap <F5> :call CompileRunGcc()<CR>
noremap s :FloatermNew --autoclose=0 gcc % -o %< && ./%< <CR>

function! CompileRunGcc() " ! compels to redefine the function that already exists
  execute "w"
  if &filetype=='c'
    if !isdirectory('build')
     "! indicates that the following command can be excuted outside of the vim
      execute "!mkdir build" 
    endif
   "execute "!clear"
    execute "!gcc % -o build/%<"
    execute "!time ./build/%<"
  endif
endfunction

"-----------plug------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline' | Plug 'vim-airline/vim-airline-themes'
"Plug 'SirVer/ultisnips'" 
"Plug 'honza/vim-snippets'
"Auto pairs
Plug 'jiangmiao/auto-pairs' 

"About surroundings' operation.
Plug 'tpope/vim-surround'

Plug 'skywind3000/asyncrun.vim'

Plug 'preservim/nerdcommenter'

Plug 'preservim/nerdtree'

Plug 'morhetz/gruvbox'

Plug 'luochen1990/rainbow'

Plug 'skywind3000/vim-terminal-help'

Plug 'neoclide/coc.nvim',{'branch':'release'}

Plug 'voldikss/vim-floaterm'
call plug#end()

"-----rainbow
let g:rainbow_active = 1

"-----colorscheme

colorscheme gruvbox

"-----COC-extensions

let g:coc_global_extensions=['coc-json','coc-vimlsp','coc-snippets','coc-marketplace','coc-ccls']

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-o> coc#refresh()




" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> - <Plug>(coc-diagnostic-prev)
nmap <silent> = <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

"
"---coc-snippets
"
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

"---------------------------------------
"----------airlinetheme-----------------
"---------------------------------------
"let g:airline_theme='light'
let g:airline_theme='cobalt2'
let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline_statusline_ontop=1
"let g:UltiSnipsExpandTrigger = '<tab>'
"let g:UltiSnipsJumpForwardTrigger = '<tab>'
"let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
"let g:UltiSnipsEditSplit="vertical"
"map a shortcut to open NERDTree
map <leader>t :NERDTreeToggle<CR>


"---------------------------------------
"----------nerdcommenter----------------
"---------------------------------------
let g:NERDSpaceDelims = 1

"----------floaterm-------
nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>
