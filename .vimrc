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
set colorcolumn=100

set nocompatible              " be iMproved, required
filetype off                  " required

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
Plug 'rhysd/vim-llvm'
Plug 'heavenshell/vim-pydocstring', { 'do': 'make install', 'for': 'python' }
Plug 'derekwyatt/vim-fswitch'
Plug 'liuchengxu/vista.vim'
Plug 'lyuts/vim-rtags'
Plug 'ludovicchabant/vim-gutentags'
Plug 'bfrg/vim-cpp-modern'
Plug 'airblade/vim-gitgutter'

" latex
let g:tex_flavor='latex'
"let g:vimtex_view_method='zathura'
let g:vimtex_view_method='sioyek'
let g:vimtex_quickfix_mode=0
let g:vimtex_complete_enabled=1
"let g:vimtex_compiler_method='generic'
"let g:vimtex_compiler_generic = {
"    \ 'cmd': 'make',
"  \}

let g:pydocstring_doq_path='/home/mcopik/.local/bin/doq'

" R plugin
" https://github.com/jalvesaq/Nvim-R/issues/261
" Plug 'jalvesaq/Nvim-R'
" let g:ycm_semantic_triggers = { 'r' : ['.','::', '$', '@'] }
" https://github.com/jalvesaq/Nvim-R/blob/master/doc/Nvim-R.txt#L1159
" let R_assign = 0

" https://github.com/JamshedVesuna/vim-markdown-preview
"Plug 'JamshedVesuna/vim-markdown-preview'
"let vim_markdown_preview_github=1
"let vim_markdown_preview_toggle=3

" https://github.com/iamcco/markdown-preview.nvim
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

" Track the engine.
Plug 'SirVer/ultisnips'

" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

" Trigger configuration. You need to change this to something other than
" <tab> if you use one of the following:
" - https://github.com/Valloric/YouCompleteMe
" - https://github.com/nvim-lua/completion-nvim
let g:UltiSnipsExpandTrigger="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

call plug#end()

" https://github.com/vim-airline/vim-airline
let g:airline_theme='badwolf'
let g:airline_powerline_fonts = 1
let g:ycm_python_binary_path = 'python3'
let g:ycm_confirm_extra_conf = 0
" nerdtree
" map <C-o> :NERDTreeToggle<CR>
map <C-f> :NERDTreeToggle<CR>

" youcomplete me
" https://github.com/Valloric/YouCompleteMe/issues/524
let g:ycm_autoclose_preview_window_after_completion=1

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_log_level = 'debug'

let g:ycm_auto_hover = 'CursorHold'

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"


" mapping jumping to definitions
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gr :YcmCompleter GTReferences<CR>
command! -nargs=* GTSymbol :YcmCompleter GoToSymbol <args>
map <leader>fi :YcmCompleter FixIt<CR>

" https://idie.ru/posts/vim-modern-cpp/
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
au BufWinEnter * match ExtraWhitespace /\s\+$/
au InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
au InsertLeave * match ExtraWhitespace /\s\+$/
au BufWinLeave * call clearmatches()
" Remove all trailing whitespaces
nnoremap <silent> <leader>rs :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>

function! s:JbzCppMan()
  let old_isk = &iskeyword
  setl iskeyword+=:
  let str = expand("<cword>")
  let &l:iskeyword = old_isk
  execute 'Man ' . str
endfunction
command! JbzCppMan :call s:JbzCppMan()
au FileType cpp nnoremap <buffer>K :JbzCppMan<CR>

" fswitch configuration
au BufEnter *.h  let b:fswitchdst = "c,cpp,cc,m"
au BufEnter *.cc let b:fswitchdst = "h,hpp"
au BufEnter *.h let b:fswitchdst = 'c,cpp,m,cc' | let b:fswitchlocs = 'reg:|include.*|src/**|'
nnoremap <silent> <A-o> :FSHere<cr>
" Extra hotkeys to open header/source in the split
nnoremap <silent> <localleader>oh :FSSplitLeft<cr>
nnoremap <silent> <localleader>oj :FSSplitBelow<cr>
nnoremap <silent> <localleader>ok :FSSplitAbove<cr>
nnoremap <silent> <localleader>ol :FSSplitRight<cr>

" vista
let g:vista#renderer#enable_icon = 1
let g:vista_default_executive = 'ctags'

" gutentags
set tags=./tags;
let g:gutentags_ctags_exclude_wildignore = 1
let g:gutentags_ctags_exclude = [
    \'node_modules', '_build', 'build', 'CMakeFiles', '.mypy_cache', 'venv',
  \'*.md', '*.tex', '*.css', '*.html', '*.json', '*.xml', '*.xmls', '*.ui']

" clang-format
function! s:JbzClangFormat(first, last)
  let l:winview = winsaveview()
  execute a:first . "," . a:last . "!clang-format-15"
  call winrestview(l:winview)
endfunction
command! -range=% JbzClangFormat call <sid>JbzClangFormat (<line1>, <line2>)
au FileType c,cpp nnoremap <buffer><leader>lf :<C-u>JbzClangFormat<CR>
au FileType c,cpp vnoremap <buffer><leader>lf :JbzClangFormat<CR>

" syntax highlighting
" Enable highlighting of C++11 attributes
let g:cpp_attributes_highlight = 1

" Highlight struct/class member variables (affects both C and C++ files)
let g:cpp_member_highlight = 1

" Put all standard C and C++ keywords under Vim's highlight group 'Statement'
" (affects both C and C++ files)
let g:cpp_simple_highlight = 1

" https://github.com/airblade/vim-gitgutter
set updatetime=100

set exrc
set secure
