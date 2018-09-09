set nocompatible              " be iMproved, required
syntax on
set nowrap
set encoding=utf8

filetype off                  " required

" set the runtime path to include Vundle and initialize 
set rtp+=$HOME/.vim/bundle/Vundle.vim/ 
call vundle#begin('$HOME/.vim/bundle')

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'w0rp/ale'
Plugin 'itchyny/lightline.vim'
Plugin 'maximbaz/lightline-ale'

call vundle#end()            " required
filetype plugin indent on    " required

set number
set ruler

set laststatus=2
set cursorline

" colorscheme spacegray

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" open up nerdtree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ale_sign_column_always = 1
let g:ale_linters_explicit = 1
let g:ale_linters = {'javascript': ['standard']}
let g:ale_fixers = {'javascript': ['standard']}
let g:ale_fix_on_save = 1

let g:lightline = {}  

let g:lightline.component_expand = {
	\  'linter_checking': 'lightline#ale#checking',
	\  'linter_warnings': 'lightline#ale#warnings',
	\  'linter_errors': 'lightline#ale#errors',
	\  'linter_ok': 'lightline#ale#ok',
\ }

let g:lightline.component_type = {
      \     'linter_checking': 'left',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'left',
\ }

let g:lightline.active = { 'right': [[ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ]] }
