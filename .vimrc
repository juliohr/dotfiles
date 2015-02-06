set nocompatible              
filetype off                 

" Set leader
let mapleader = ','

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

"incremental search"
set incsearch

"highlight search"
set hlsearch
map <Enter> :nohlsearch <Enter>


"NERDTree biding key
nnoremap <silent> <F7> :NERDTreeToggle<cr>
nmap <S-F7> :NERDTreeClose<CR>

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

" Navigation between files
nnoremap ,, <c-^>

" source $MYVIMRC reloads the saved $MYVIMRC
nmap <Leader>s :source $MYVIMRC<CR>

" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
 nmap <Leader>v :e $MYVIMRC<CR>

"only for pamweb
function! EditFileIfExists(file)
  if filereadable(a:file)
    :execute 'edit' a:file
  else
    :echom "File does not exists: " . a:file
  endif
endfunction

nmap <Leader>t :call EditFileIfExists(substitute(substitute(@%, 'app\/js', 'test\/unit', 'g'), '\.js', '-spec.js', 'g'))<CR>
nmap <Leader>w :call EditFileIfExists(substitute(substitute(@%, 'test\/unit', 'app\/js', 'g'), '-spec\.js', '.js', 'g'))<CR>

"Vundle Plugins
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
