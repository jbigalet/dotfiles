set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'JuliaLang/julia-vim'
Plugin 'a.vim'
" Plugin 'Valloric/YouCompleteMe'

call vundle#end()

set noswapfile

set expandtab
set tabstop=4
set shiftwidth=4

syn on

nnoremap <SPACE> <Nop>
let mapleader=" "

colorscheme desertEx 

filetype plugin indent on

if !has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

nmap <Leader>l :setlocal number!<CR>

set autoindent
set incsearch

let g:sparkupNextMapping = '<c-x>'

nnoremap <Leader>p :CtrlPBuffer<CR>
nnoremap <Leader>o :A<CR>
nnoremap <Leader>O :AV<CR>

map <C-n> :NERDTreeToggle<CR>

map <Leader>s :w <Enter>

map <Leader>v :sp ~/.vimrc<CR>
au BufWritePost .vimrc so ~/.vimrc 

map <C-j> :%!python -m json.tool <Enter>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

ca w!! w !sudo tee % >/dev/null

map <C-b> :ConqueTerm bash<CR>

" map <C-d> <C-w>q

map <C-S-x> :bp<bar>sp<bar>bn<bar>bd<CR>
map <C-x> :bd<CR>
map <tab> :bn<CR>
map <S-tab> :bp<CR>

set nopaste

imap jj <esc>

nmap K 0i//<esc>
vmap K 0<C-v>I//<esc>

map <C-k> :s/\/\///g<CR><esc>

vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

noremap m l
noremap l k
noremap k j
noremap j h

nnoremap <C-j> <C-w><C-h>
nnoremap <C-k> <C-w><C-j>
nnoremap <C-l> <C-w><C-k>
nnoremap <C-m> <C-w><C-l>

" j <=> <A-j>, in 7 bit mode terminal. Reminder: to print j, press <C-v> <A-j>
nnoremap j :!julia %<CR>
nnoremap k :!make client<CR>
nnoremap l :!make client2<CR>

" C++ autoinsert header
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:r")), "\\.", "_", "g")
  let classname = substitute(expand("%:r"), '^.\|_\zs\a', '\u&', 'g')
  execute "normal! i#ifndef DEF_" . gatename
  execute "normal! o#define DEF_" . gatename . " "
  execute "normal! o\<CR>class " . classname . " {"
  execute "normal! opublic:"
  execute "normal! o" . classname . "();"
  execute "normal! o~" . classname . "();"
  execute "normal! o};"
  execute "normal! Go\<CR>#endif /* DEF_" . gatename . " */"
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

function! s:insert_implementation()
  let classname = substitute(expand("%:r"), '^.\|_\zs\a', '\u&', 'g')
  execute "normal! i#include \"" . expand("%:r") . ".h\""
  execute "normal! o\<CR>" . classname . "::" . classname . "() {"
  execute "normal! o\<CR>}"
  execute "normal! o\<CR>" . classname . "::~" . classname . "() {"
  execute "normal! o\<CR>}"
endfunction
autocmd BufNewFile *.{c,cpp} call <SID>insert_implementation()
