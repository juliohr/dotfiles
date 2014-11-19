set nocompatible              
filetype off                 

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"incremental search"
set incsearch

"highlight search"
set hlsearch
map <Enter> :nohlsearch <Enter>

"no backup"
set nobackup
set nowb
set noswapfile

" Text, tab and ident related
"set smarttab
set expandtab " spaces instead of tab
set shiftwidth=2 " tab == 2 spaces
set tabstop=2

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l



Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snipets'
Plugin 'claco/jasmine.vim'


call vundle#end()            
call pathogen#infect()
filetype plugin indent on   
syntax enable
set background=dark
colorscheme solarized
set nu
let NERDTreeDirArrows=0
