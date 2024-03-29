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
" Plug 'a.vim', { 'for': ['c', 'cpp'] }
" Plug 'jbigalet/vim-less', { 'for': 'less' }
" Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-markdown', { 'for': 'markdown' }
Plug 'joom/latex-unicoder.vim', { 'for': 'tex' }
" Plug 'mbbill/desertEx'
Plug 'tomasr/molokai'
" Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-surround'
" Plug 'jmcantrell/vim-virtualenv', { 'for': 'python' }
" Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'mhinz/vim-startify'
Plug 'hynek/vim-python-pep8-indent', { 'for': 'python' }
" Plug 'scrooloose/nerdtree'
" Plug 'jwalton512/vim-blade', { 'for': 'blade' }
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'StanAngeloff/php.vim', { 'for': 'php' }
Plug 'sjl/gundo.vim'
Plug 'dyng/ctrlsf.vim'
Plug 'jreybert/vimagit'
"Plug 'altercation/vim-colors-solarized'
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'xml'] }
Plug 'tpope/vim-eunuch'
Plug 'PotatoesMaster/i3-vim-syntax', { 'for': 'i3' }
Plug 'AndrewRadev/linediff.vim'
" Plug 'junegunn/vim-peekaboo'
Plug 'justinmk/vim-sneak'
Plug 'michaeljsmith/vim-indent-object'
" Plug 'mtth/scratch.vim'
Plug 'tpope/vim-repeat'
" Plug 'tpope/vim-abolish'
Plug 'svermeulen/vim-easyclip'
Plug 'kana/vim-fakeclip'
" Plug 'justinmk/vim-gtfo'
Plug 'kopischke/vim-fetch'
Plug 'chrisbra/Colorizer', { 'on': ['ColorHighlight'] }
Plug 'inside/vim-search-pulse'
" Plug 'gcavallanti/vim-noscrollbar'
Plug 'tpope/vim-obsession'
Plug 'AndrewRadev/sideways.vim'
" Plug 'bkad/CamelCaseMotion'
Plug 'kshenoy/vim-signature'

Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
" Plug 'junegunn/seoul256.vim'
Plug 'beyondmarc/glsl.vim'
Plug 'beyondmarc/hlsl.vim'

" Plug 'LucHermitte/lh-vim-lib'
" Plug 'LucHermitte/VimFold4C'

Plug 'mustache/vim-mustache-handlebars'

" Plug 'beyondmarc/glsl.vim'
Plug 'tikhomirov/vim-glsl'

Plug 'stephpy/vim-yaml'

" Plug 'bkad/CamelCaseMotion'

Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'Konfekt/FastFold'

" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh', 'for': ['c', 'cpp', 'python'] }
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable'}

"   bloat {{{
call plug#end()
"   }}}
" }}}

set noswapfile

set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smarttab
set regexpengine=1

set clipboard=unnamedplus

" set linebreak "wrap on words, not on character

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
let g:rehash256 = 1
colorscheme molokai

filetype plugin indent on

if !has('gui_running')
  set ttimeoutlen=0
  augroup FastEscape
    autocmd!
    autocmd InsertEnter * set timeoutlen=100
    autocmd InsertLeave * set timeoutlen=1000
  augroup END
endif

" inoremap jk <esc>
" inoremap kj <esc>
" inoremap kl <esc>
" inoremap lk <esc>

nnoremap gS :Scratch<CR>

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256

let g:fastfold_savehook = 0

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

nnoremap - <C-w><
nnoremap è <C-w>>

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

nnoremap <silent> <Leader>r :syn sync fromstart<CR>


let g:SimpylFold_docstring_preview = 1
autocmd BufWinEnter *.py setlocal foldexpr=SimpylFold(v:lnum) foldmethod=expr
autocmd BufWinLeave *.py setlocal foldexpr< foldmethod<

"ctrlp: ignore files matched by .gitignore if any
if executable('ag')
    let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'
else
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    let g:ctrlp_custom_ignore = 'Levels'
endif


nnoremap <Leader>P :let ctrlp_user_cmd_bck = ctrlp_user_command<CR>:let ctrlp_user_command = []<CR>:CtrlPClearCache<CR>:CtrlP<CR>:let ctrlp_user_command = ctrlp_user_cmd_bck<CR>:CtrlPClearCache<CR>
nnoremap <Leader>p :CtrlPBuffer<CR>

let g:ctrlp_reuse_window = 'startify'

let g:peekaboo_window = 'vertical topleft 30new'

nnoremap <expr> ZZ 'zz' . winheight(0)/4 . '<C-e>'
nnoremap <expr> ZT 'zz' . winheight(0)/4 . '<C-e>'
nnoremap <expr> ZB 'zz' . winheight(0)/4 . '<C-y>'

" disable autofolding while typing
" autocmd InsertLeave,WinEnter * setlocal foldmethod=syntax
" autocmd InsertEnter,WinLeave * setlocal foldmethod=manual

autocmd! BufNewFile,BufRead *.glsl set filetype=glsl

nnoremap <Leader>o :A<CR>
nnoremap <Leader>O :AV<CR>

map <Leader>s :w <Enter>

let g:gitgutter_diff_args = '-w'  " git-gutter: ignore whitespaces

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

nnoremap <C-b> <C-x>
nnoremap <C-x> :call ExecuteThisOrThatIfNoBuffer('bd', 'q')<CR>
nnoremap x :bp\|bd #<CR>
nnoremap <Leader>x <C-w>q

augroup GroupVimrc
  autocmd!
  autocmd BufWritePost .vimrc so ~/.vimrc
augroup END

command! JsonFormatting %!python -m json.tool

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_tabs = 1
" let g:airline#extensions#tabline#fnamemod = ':t'

ca w!! w !sudo tee % >/dev/null

map <tab> :tabnext<CR>
map <S-tab> :tabprevious<CR>
nnoremap <C-w>o :tab split<CR>

set nopaste

nnoremap S :Commentary<CR>
vnoremap s :Commentary<CR>

" vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
" nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
" map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
" map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P

" noremap gm m  " no needed while using signature mode to handle marking
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

nnoremap <Left> <C-w><S-h>
nnoremap <Down> <C-w><S-j>
nnoremap <Up> <C-w><S-k>
nnoremap <Right> <C-w><S-l>

" j <=> <A-j>, in 7 bit mode terminal. Reminder: to print j, press <C-v> <A-j>
autocmd FileType julia nnoremap <buffer> j :!julia %<CR>
autocmd FileType python nnoremap <buffer> j :!python2 %<CR>
autocmd FileType cpp nnoremap <buffer> j :make! run<CR>
autocmd FileType asm nnoremap <buffer> j :!./run<CR>
autocmd FileType tex nnoremap <buffer> j :make! run<CR>

" align C preproc blocks
autocmd FileType cpp,c vnoremap <buffer> X :<home>silent!<end>s/\([^\\]\)$/\1\\/<CR>gv<bar>:s/\\$/   \\/<CR>gv<bar>:EasyAlign /   \\/$<CR>
autocmd FileType cpp,c nnoremap <buffer> X vip:<home>silent!<end>s/\([^\\]\)$/\1\\/<CR>gv<bar>:s/\\$/   \\/<CR>gv<bar>:EasyAlign /   \\$/<CR>gvV$x:s/ \+$//g<CR>


if v:version >= 703
  autocmd BufRead * set colorcolumn=
  autocmd BufRead *.py set colorcolumn=100
endif

" nnoremap k :!make client<CR>
" nnoremap l :!make client2<CR>

set pastetoggle=<F1>

" C++ autoinsert header
" function! s:insert_gates()
"   let gatename = substitute(toupper(expand("%:r")), "\\.", "_", "g")
"   let classname = substitute(expand("%:r"), '^.\|_\zs\a', '\u&', 'g')
"   execute "normal! i#ifndef DEF_" . gatename
"   execute "normal! o#define DEF_" . gatename . " "
"   execute "normal! o\<CR>class " . classname . " {"
"   execute "normal! opublic:"
"   execute "normal! o" . classname . "();"
"   execute "normal! o~" . classname . "();"
"   execute "normal! o};"
"   execute "normal! Go\<CR>#endif /* DEF_" . gatename . " */"
" endfunction
" autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

" function! s:insert_implementation()
"   let classname = substitute(expand("%:r"), '^.\|_\zs\a', '\u&', 'g')
"   execute "normal! i#include \"" . expand("%:r") . ".h\""
"   execute "normal! o\<CR>" . classname . "::" . classname . "() {"
"   execute "normal! o\<CR>}"
"   execute "normal! o\<CR>" . classname . "::~" . classname . "() {"
"   execute "normal! o\<CR>}"
" endfunction
" autocmd BufNewFile *.{c,cpp} call <SID>insert_implementation()

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
let g:ycm_server_python_interpreter="/usr/bin/python2"

set scrolloff=3

set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_python_python_exec = '/usr/bin/python2'
let g:syntastic_python_checkers = ['flake8', 'python']
let g:syntastic_python_flake8_exec = 'flake8-python2'

" disable syntastic by default
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

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

set iskeyword+=_
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

command! -range CamelCaseToSnakeCase :<line1>,<line2>s#\C\(\<\u[a-z0-9]\+\|[a-z0-9]\+\)\(\u\)#\l\1_\l\2#g

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

nnoremap ! s-><Esc>
nnoremap § "_c2l.<Esc>

autocmd WinEnter    * set cursorline
autocmd WinLeave    * set nocursorline
autocmd InsertEnter * set nocursorline
autocmd InsertLeave * set cursorline

nnoremap gV `[v`] " highlight last inserted text

nnoremap <leader>u :GundoToggle<CR>

autocmd FileType vim set foldmethod=marker | set foldlevel=0
autocmd FileType cpp set foldmethod=syntax | set foldlevel=0 | set foldnestmax=1

" disable autofolding while in insert mode
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif

nnoremap ZA zA

autocmd FileType rst nnoremap <buffer> HH :t.\|s/./`/g<CR>
autocmd FileType rst nnoremap <buffer> H- :t.\|s/./-/g<CR>
autocmd FileType rst nnoremap <buffer> H= :t.\|s/./=/g<CR>

let g:ctrlsf_default_root = 'project'
nmap <C-F> <Plug>CtrlSFPrompt
nmap <C-F>w <Plug>CtrlSFCwordExec
nmap <C-F>/ <Plug>CtrlSFPwordExec
nmap <C-F>r <Plug>CtrlSFPrompt -R 
vmap <C-F> <Plug>CtrlSFVwordExec

nmap <Leader>d yyP:Commentary<CR>k
vmap <Leader>d :Commentary<CR>gvyPgv:Commentary<CR>

autocmd FileType python nnoremap <buffer> <Leader>D "nyawoprint '<C-r>n: %s' % str(<C-r>n)<esc>
autocmd FileType python vnoremap <buffer> <Leader>D "nyoprint '<C-r>n: %s' % str(<C-r>n)<esc>

autocmd FileType cpp nnoremap <buffer> <Leader>D "nyiwoio::println("<C-r>n: ", <C-r>n);<esc>
autocmd FileType cpp vnoremap <buffer> <Leader>D "nyoio::println("<C-r>n: ", <C-r>n);<esc>
autocmd FileType c,cpp set foldmethod=syntax
autocmd FileType c,cpp set foldnestmax=1

autocmd FileType c,cpp nnoremap <buffer> k zj
autocmd FileType c,cpp nnoremap <buffer> l zk

" Abolish udpate update

" Easy clip
let g:EasyClipAlwaysMoveCursorToEndOfPaste = 1
let g:EasyClipAutoFormat = 0

nmap <leader>a <plug>EasyClipToggleFormattedPaste

let g:EasyClipUseCutDefaults = 0

nmap h <Plug>MoveMotionPlug
xmap h <Plug>MoveMotionXPlug
nmap hh <Plug>MoveMotionLinePlug
" nmap H <Plug>MoveMotionEndOfLinePlug


let g:EasyClipUsePasteToggleDefaults = 0

nmap <Leader>n <plug>EasyClipSwapPasteForward
nmap <Leader>N <plug>EasyClipSwapPasteBackwards

nmap <silent> gh <plug>SubstituteOverMotionMap
nmap ghh <plug>SubstituteLine
nmap gH <plug>SubstituteLine
xmap gh <plug>XEasyClipPaste

omap aa <Plug>SidewaysArgumentTextobjA
xmap aa <Plug>SidewaysArgumentTextobjA
omap ia <Plug>SidewaysArgumentTextobjI
xmap ia <Plug>SidewaysArgumentTextobjI

" call camelcasemotion#CreateMotionMappings('<leader>')
" omap <silent> a, <Plug>CamelCaseMotion_ie
" xmap <silent> a, <Plug>CamelCaseMotion_ie
" omap <silent> i, <Plug>CamelCaseMotion_ie
" xmap <silent> i, <Plug>CamelCaseMotion_ie

" let g:gtfo#terminals = { 'unix' : 'urxvt -cd' }
nnoremap <Leader><CR> hf s<CR><Esc>l

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


let g:SignatureMap = {
      \ 'Leader'             :  "gm",
      \ 'PlaceNextMark'      :  "gm,",
      \ 'ToggleMarkAtLine'   :  "gm.",
      \ 'PurgeMarksAtLine'   :  "gm-",
      \ 'DeleteMark'         :  "dm",
      \ 'PurgeMarks'         :  "gm<Space><Space><Space>x",
      \ 'PurgeMarkers'       :  "",
      \ 'GotoNextLineAlpha'  :  "']",
      \ 'GotoPrevLineAlpha'  :  "'[",
      \ 'GotoNextSpotAlpha'  :  "`]",
      \ 'GotoPrevSpotAlpha'  :  "`[",
      \ 'GotoNextLineByPos'  :  "]'",
      \ 'GotoPrevLineByPos'  :  "['",
      \ 'GotoNextSpotByPos'  :  "]`",
      \ 'GotoPrevSpotByPos'  :  "[`",
      \ 'GotoNextMarker'     :  "]-",
      \ 'GotoPrevMarker'     :  "[-",
      \ 'GotoNextMarkerAny'  :  "]=",
      \ 'GotoPrevMarkerAny'  :  "[=",
      \ 'ListBufferMarks'    :  "gm/",
      \ 'ListBufferMarkers'  :  "gm?"
      \ }


let g:VM_custom_motions  = {'j': 'h', 'k': 'j', 'l': 'k', 'm': 'l'}
let g:VM_custom_remaps = {'<c-p>': 'N', '<c-x>': 'q'}
let g:VM_maps = {}
let g:VM_maps["Find Operator"] = ''
let g:VM_theme = 'codedark'
