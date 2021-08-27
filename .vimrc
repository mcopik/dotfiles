syntax enable
" Try the following if your GUI uses a dark background.
:highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" http://vim.wikia.com/wiki/Highlight_unwanted_spaces
" Show trailing whitepace and spaces before a tab:
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
syntax on
colorscheme desert

filetype indent on
" filetype plugin indent on
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set smarttab
set number
set showcmd
set cursorline
" https://stackoverflow.com/questions/526858/how-do-i-make-vim-do-normal-bash-like-tab-completion-for-file-names
set wildmode=longest,list
set wildmenu
set lazyredraw
set showmatch
set incsearch
set hlsearch
" https://superuser.com/questions/163589/switch-buffers-in-vim-without-saving-to-a-currently-modified-file
set hidden
set colorcolumn=80

set nocompatible              " be iMproved, required
filetype off                  " required

"let vim_markdown_preview_toggle=3


" https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'VundleVim/Vundle.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-eunuch'
Plug 'scrooloose/nerdtree'
Plug 'editorconfig/editorconfig-vim'
Plug 'Valloric/YouCompleteMe'
Plug 'elzr/vim-json'
Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
" R plugin
" https://github.com/jalvesaq/Nvim-R/issues/261
Plug 'jalvesaq/Nvim-R'
let g:ycm_semantic_triggers = { 'r' : ['.','::', '$', '@'] }
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1159
let R_assign = 0

" https://github.com/JamshedVesuna/vim-markdown-preview
"Plug 'JamshedVesuna/vim-markdown-preview'
"let vim_markdown_preview_github=1
"let vim_markdown_preview_toggle=3

" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
"
call plug#end()

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
let g:ycm_log_level = 'debug'


set exrc
set secure
