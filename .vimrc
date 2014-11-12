set noswapfile

set expandtab
set tabstop=2
set shiftwidth=2

syn on

let mapleader = "\<Space>"

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


:nmap <Leader>l :setlocal number!<CR>

:set autoindent
:set incsearch

let g:sparkupNextMapping = '<c-x>'

:map <C-n> :NERDTreeToggle<CR>
:map <Leader>s :w <Enter>

:map <C-j> :%!python -m json.tool <Enter>

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

ca w!! w !sudo tee % >/dev/null

:map <C-b> :ConqueTerm bash<CR>
