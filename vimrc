set nocompatible

" Plug {{{
"   bloat {{{ 
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
"   }}}
" Plug 'JuliaLang/julia-vim', { 'for': 'julia' }
Plug 'a.vim', { 'for': ['c', 'cpp'] }
Plug 'jbigalet/vim-less', { 'for': 'less' }
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'joom/latex-unicoder.vim'
" Plug 'mbbill/desertEx'
Plug 'tomasr/molokai'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
" Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'scrooloose/nerdtree'
Plug 'jwalton512/vim-blade', { 'for': 'blade' }
Plug 'terryma/vim-multiple-cursors'
Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jreybert/vimagit'
"Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'xml'] }
Plug 'tpope/vim-eunuch'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'AndrewRadev/linediff.vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"if (v:version > 703 || v:version == 703 && has('patch598')) && has('python')
  Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
  "Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'for': ['c', 'cpp', 'python'] }
"endif

"   bloat {{{
call plug#end()
"   }}}
" }}}

set noswapfile

set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
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
inoremap kl <esc>
inoremap lk <esc>

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
set nohlsearch

if v:version > 703 || v:version == 703 && has("patch541")
  set formatoptions+=j " delete comment character when joining commented lines
endif

set autoread

set sessionoptions-=options

" Use Leader C to clear the highlighting of :set hlsearch.
nnoremap <silent> <Leader>c :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
nnoremap <silent> <Leader>C :set hlsearch!<CR>


let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

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

map <Leader>s :w <Enter>

function! AddTableHeader()
  exec ":t.|s/[^|]/-/g|s/-|-/ | /g"
endfunction
command! AddTableHeader call AddTableHeader()
autocmd FileType markdown nnoremap <buffer> <Leader>h :AddTableHeader<CR>

function! OpenThereOrInSplit(file, splittype)
  if &filetype == 'startify'
    exec 'e' a:file
  elseif line('$') == 1 && getline(1) == '' && bufname('%') == ''
    exec 'e' a:file '|bd #'
  else
    exec a:splittype a:file
  endif
endfunction

nnoremap <Leader>v :call OpenThereOrInSplit("~/.vimrc", 'sp')<CR>
nnoremap <Leader>V :call OpenThereOrInSplit("~/.vimrc", 'vs')<CR>

function! ExecuteThisOrThatIfNoBuffer(this, that)
  if (&filetype == 'startify' || (line('$') == 1 && getline(1) == '' && bufname('%') == '')) && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) <= 1
    exec a:that
  else
    exec a:this
  endif
endfunction

nnoremap <C-x> :call ExecuteThisOrThatIfNoBuffer('bd', 'q')<CR>
nnoremap x :bp\|bd #<CR>
nnoremap <Leader>x <C-w>q

augroup GroupVimrc
  autocmd!
  autocmd BufWritePost .vimrc so ~/.vimrc
augroup END

command! JsonFormatting %!python -m json.tool

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

ca w!! w !sudo tee % >/dev/null

map <tab> :bn<CR>
map <S-tab> :bp<CR>

set nopaste

nnoremap S :Commentary<CR>
vnoremap s :Commentary<CR>

vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

noremap h m
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
autocmd FileType julia nnoremap <buffer> j :!julia %<CR>
autocmd FileType python nnoremap <buffer> j :!python2 %<CR>

if v:version >= 703
  autocmd BufRead * set colorcolumn=
  autocmd BufRead *.py set colorcolumn=100
endif

" nnoremap k :!make client<CR>
" nnoremap l :!make client2<CR>

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

autocmd FileType php setlocal commentstring=//\ %s

let g:user_emmet_install_global = 0
autocmd FileType html,css,xml EmmetInstall
let g:user_emmet_mode="i"
let g:user_emmet_leader_key='<C-E>'

" set iskeyword-=_
" set iskeyword+=$,@,%,#

set modeline
set modelines=10

set tabpagemax=50

autocmd FileType vim setlocal keywordprg=:help

set list listchars=trail:.,tab:>.
highlight SpecialKey ctermfg=DarkGray ctermbg=Black

" set whichwrap+=h,l

set ignorecase
set smartcase

set nojoinspaces

command! StripWhitespace %s/ \+$//gc
command! StripWhitespaceForce %s/ \+$//g

" cnoremap <C-j> <Left>
" cnoremap <C-k> <Down>
" cnoremap <C-l> <Up>
" cnoremap <C-m> <Right>

nnoremap / ms/

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

nnoremap <leader>q  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

vnoremap <  <gv
vnoremap >  >gv

autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

nnoremap gV `[v`] " highlight last inserted text

nnoremap <leader>u :GundoToggle<CR>

autocmd FileType vim set foldmethod=marker | set foldlevel=0

nnoremap ZA zA

autocmd FileType rst nnoremap <buffer> HH :t.\|s/./`/g<CR>
autocmd FileType rst nnoremap <buffer> H- :t.\|s/./-/g<CR>
autocmd FileType rst nnoremap <buffer> H= :t.\|s/./=/g<CR>

nmap <C-F> <Plug>CtrlSFPrompt
nmap <C-F>w <Plug>CtrlSFCwordExec
nmap <C-F>/ <Plug>CtrlSFPwordExec
vmap <C-F> <Plug>CtrlSFVwordExec

nmap <Leader>d yyP:Commentary<CR>k
vmap <Leader>d :Commentary<CR>gvyPgv:Commentary<CR>

autocmd FileType python nnoremap <buffer> <Leader>D "nyawoprint '<C-r>n: %s' % str(<C-r>n)<esc>
autocmd FileType python vnoremap <buffer> <Leader>D "nyoprint '<C-r>n: %s' % str(<C-r>n)<esc>
