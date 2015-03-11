set noswapfile

set expandtab
set tabstop=2
set shiftwidth=2

syn on

nnoremap <Space> <Nop>
map <Space> <Leader>

colorscheme desertEx 

filetype on
filetype plugin on
filetype indent on

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

map <C-n> :NERDTreeToggle<CR>
map <Leader>s :w <Enter>

map <Leader>v :sp ~/.vimrc<CR>
au BufWritePost .vimrc so ~/.vimrc 

map <C-j> :%!python -m json.tool <Enter>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

ca w!! w !sudo tee % >/dev/null

map <C-b> :ConqueTerm bash<CR>

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
