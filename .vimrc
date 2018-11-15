syntax enable
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set showcmd
set cursorline
filetype indent on
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
" https://superuser.com/questions/163589/switch-buffers-in-vim-without-saving-to-a-currently-modified-file
set hidden

set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
Plugin 'tpope/vim-eunuch'
Plugin 'scrooloose/nerdtree'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'Valloric/YouCompleteMe'
" R plugin
" https://github.com/jalvesaq/Nvim-R/issues/261
Plugin 'jalvesaq/Nvim-R'
let g:ycm_semantic_triggers = { 'r' : ['.','::', '$', '@'] }
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1159
let R_assign = 0

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" https://github.com/vim-airline/vim-airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:ycm_python_binary_path = 'python3'
let g:ycm_confirm_extra_conf = 0
" nerdtree
map <C-o> :NERDTreeToggle<CR>

" youcomplete me
" https://github.com/Valloric/YouCompleteMe/issues/524
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
