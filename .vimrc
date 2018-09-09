set nocompatible
syntax on
set nowrap
set encoding=utf8
set number
set ruler
set laststatus=2
set cursorline

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tomasiser/vim-code-dark'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'

" All of your Plugins must be added before the following line
call vundle#end()          
filetype plugin indent on   

colorscheme codedark
let g:airline_theme = 'codedark'

" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" open up nerdtree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ale_sign_column_always = 1
" uncomment below to switch from eslint to standard.. not sure yet how to detect the proper one to use
" let g:ale_linters_explicit = 1
" let g:ale_linters = {'javascript': ['standard']}
" let g:ale_fixers = {'javascript': ['standard']}
let g:ale_fix_on_save = 1
