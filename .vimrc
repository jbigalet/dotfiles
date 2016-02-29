set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'JuliaLang/julia-vim'
Plugin 'a.vim'
Plugin 'jbigalet/vim-less'
Plugin 'elzr/vim-json'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/vim-easy-align'
Plugin 'tpope/vim-markdown'
Plugin 'joom/latex-unicoder.vim'

" Plugin 'Valloric/YouCompleteMe'

Plugin 'tomasr/molokai'
Plugin 'mbbill/desertEx'

call vundle#end()

set noswapfile

set expandtab
set tabstop=2
set shiftwidth=2

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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nmap <Leader>l :setlocal number!<CR>

set autoindent
set incsearch

let g:sparkupNextMapping = '<c-x>'

" broken ?
"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/]\.(git|hg|svn|uploads)$',
"  \ 'file': '\v\.(exe|so|dll|jpg|png|jpeg|bmp|pdf)$',
"  \ }

"ctrlp: ignore files matched by .gitignore if any
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nnoremap <Leader>P :let ctrlp_user_command = []<CR>:CtrlPClearCache<CR>:CtrlP<CR>:let ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']<CR>:CtrlPClearCache<CR>
nnoremap <Leader>p :CtrlPBuffer<CR>

nnoremap <Leader>o :A<CR>
nnoremap <Leader>O :AV<CR>

map <C-n> :NERDTreeToggle<CR>

map <Leader>s :w <Enter>

map <Leader>h :t.\|s/[^\|]/-/g\|s/-\|-/ \| /g<CR>

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
nmap <C-c> :bp\|bd #<CR>
map <tab> :bn<CR>
map <S-tab> :bp<CR>

set nopaste

imap jj <esc>

nmap S 0i//<esc>
vmap S 0<C-v>I//<esc>

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

nnoremap <Leader><Left> <C-w><S-h>
nnoremap <Leader><Down> <C-w><S-j>
nnoremap <Leader><Up> <C-w><S-k>
nnoremap <Leader><Right> <C-w><S-l>

" j <=> <A-j>, in 7 bit mode terminal. Reminder: to print j, press <C-v> <A-j>
nnoremap j :!julia %<CR>
nnoremap k :!make client<CR>
nnoremap l :!make client2<CR>

nnoremap <Leader>q :set paste<CR>a<S-Ins><ESC>:set nopaste<CR>

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

let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>

set virtualedit=block "Visual block mode (<c-v>): can move outside of actual text

"Y acts as C and D
nnoremap Y y$
