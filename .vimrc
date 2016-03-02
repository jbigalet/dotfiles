set nocompatible
filetype off

" download Vundle if it not found (http://erikzaadi.com/2012/03/19/auto-installing-vundle-from-your-vimrc/)
let vundle_fresh_install=0
let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
if !filereadable(vundle_readme) 
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
  let vundle_fresh_install=1
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
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
Plugin 'mbbill/desertEx'
Plugin 'tomasr/molokai'
Plugin 'tmhedberg/SimpylFold'
Plugin 'tpope/vim-surround'
Plugin 'jmcantrell/vim-virtualenv'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mhinz/vim-startify'
Plugin 'hynek/vim-python-pep8-indent'
" Plugin 'scrooloose/nerdtree'
Plugin 'jwalton512/vim-blade'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'sjl/gundo.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'jreybert/vimagit'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'mattn/emmet-vim'

if (v:version > 703 || v:version == 703 && has(patch598)) && has('python')
  Plugin 'Valloric/YouCompleteMe'
endif

call vundle#end()

" install plugins if vundle just got installed
if vundle_fresh_install == 1
  echo "Installing Vundles, please ignore key map error messages"
  echo ""
  :PluginInstall
endif

set noswapfile

set expandtab
set tabstop=2
set shiftwidth=2
set smarttab

set linebreak "wrap on words, not on character

syn on

set wildmenu
set wildmode=longest:full,full

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

nnoremap <SPACE> <Nop>
let mapleader=" "

" colorscheme desertEx 
" autocmd BufEnter * colorscheme desertEx
" autocmd BufEnter *.py colorscheme molokai
colorscheme molokai

filetype plugin indent on

if !has('gui_running')
  set ttimeoutlen=100
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=100
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

inoremap jk <esc>
inoremap kj <esc>

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

function! LineNumberToggle()
  if(&relativenumber == 1)
    set nonumber
    set norelativenumber
  elseif(&number == 1)
    set relativenumber
  else
    set number
    set norelativenumber
  endif
endfunction
nnoremap <Leader>l :call LineNumberToggle()<CR>

set autoindent

set lazyredraw

set incsearch
set hlsearch

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " delete comment character when joining commented lines
endif

set autoread

set sessionoptions-=options

" Use Leader C to clear the highlighting of :set hlsearch.
nnoremap <silent> <Leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>


let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

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

let g:ctrlp_reuse_window = 'startify'

nnoremap <Leader>p :CtrlPBuffer<CR>

nnoremap <expr> ZZ 'zz' . winheight(0)/4 . '<C-e>'
nnoremap <expr> ZT 'zz' . winheight(0)/4 . '<C-e>'
nnoremap <expr> ZB 'zz' . winheight(0)/4 . '<C-y>'

nnoremap <Leader>o :A<CR>
nnoremap <Leader>O :AV<CR>

" map <C-n> :NERDTreeToggle<CR>

map <Leader>s :w <Enter>

map <Leader>h :t.\|s/[^\|]/-/g\|s/-\|-/ \| /g<CR>

function! OpenThereOrInSplit(file, splittype)
  if line('$') == 1 && getline(1) == '' && bufname('%') == ''
    exec 'e' a:file
  else
    exec a:splittype a:file
  endif
endfunction

nnoremap <Leader>v :call OpenThereOrInSplit("~/.vimrc", 'sp')<CR>
nnoremap <Leader>V :call OpenThereOrInSplit("~/.vimrc", 'vs')<CR>

augroup GroupVimrc
  autocmd!
  autocmd BufWritePost .vimrc so ~/.vimrc 
augroup END

nnoremap j :%!python -m json.tool <Enter>

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

nnoremap S :Commentary<CR>
vmap S :Commentary<CR>
" nmap K 0i//<esc>
" vmap K 0<C-v>I//<esc>
" map <C-k> :s/\/\///g<CR><esc>

vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

noremap m l
noremap l k
noremap k j
noremap j h

let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1
let g:unicoder_no_map = 1
inoremap <C-l> <Esc>:call unicoder#start(1)<CR>
vnoremap <C-l> <Esc>:call unicoder#selection()<CR>

nnoremap <C-j> <C-w><C-h>
nnoremap <C-k> <C-w><C-j>
nnoremap <C-l> <C-w><C-k>
nnoremap <C-m> <C-w><C-l>

nnoremap <Leader><Left> <C-w><S-h>
nnoremap <Leader><Down> <C-w><S-j>
nnoremap <Leader><Up> <C-w><S-k>
nnoremap <Leader><Right> <C-w><S-l>

" j <=> <A-j>, in 7 bit mode terminal. Reminder: to print j, press <C-v> <A-j>
autocmd FileType julia nnoremap j :!julia %<CR>
autocmd FileType python nnoremap j :!python2 %<CR>

if v:version >= 703
  autocmd BufRead * set colorcolumn=
  autocmd BufRead *.py set colorcolumn=80
endif

nnoremap k :!make client<CR>
nnoremap l :!make client2<CR>

set pastetoggle=<F1>

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

set virtualedit=block "Visual block mode (<c-v>): can move outside of actual text

"Y acts as C and D
nnoremap Y y$

function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

set scrolloff=3

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_exec = 'flake8-python2'

command! PythonBreakImports g/^import/s/, */\rimport /g 

vnoremap . :normal .<CR>

set backspace=indent,eol,start

set conceallevel=0
set hidden

nnoremap <Leader>u :GundoToggle<CR>

let g:user_emmet_leader_key='<C-E>'

