let mapleader = "\<space>"

colorscheme desertEx 

filetype on
filetype plugin on
filetype indent on

if ! has('gui_running')
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
