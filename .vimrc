set nocompatible
syntax on
set nowrap
set encoding=utf8
set number
set ruler
set laststatus=2
set cursorline
set tabstop=2
set expandtab
set shiftwidth=2
set smarttab
set directory^=$HOME/.vim/tmp// " All swp files go to a temporary directory

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
Plugin 'Valloric/YouCompleteMe'
Plugin 'elmcast/elm-vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'alvan/vim-closetag'

" All of your Plugins must be added before the following line
call vundle#end()          
filetype plugin indent on   

colorscheme codedark
let g:airline_theme = 'codedark'

let g:javascript_plugin_jsdoc = 1
let g:jsx_ext_required = 0

" open up nerdtree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let g:ale_sign_column_always = 1
" uncomment below to switch from eslint to standard.. not sure yet how to detect the proper one to use
let g:ale_linters_explicit = 1
let g:ale_linters = {'javascript': ['eslint', 'prettier']}
let g:ale_fixers = {'javascript': ['eslint', 'prettier']}
let g:ale_fix_on_save = 1

let g:go_list_type = "quickfix"
let g:go_fmt_command = "goimports"
let g:go_textobj_include_function_doc = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_generate_tags = 1
" let g:go_metalinter_autosave = 1
let g:go_auto_type_info = 1

let NERDTreeShowHidden=1

function! FormatTerraform(buffer) abort
  return {
  \   'command': 'terraform fmt -'
  \}
endfunction

execute ale#fix#registry#Add('terraform', 'FormatTerraform', ['tf'], 'terraform fmt for terraform')

let g:ale_linters_explicit = 1
let g:ale_linters = {'javascript': ['eslint']}
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'tf': ["terraform"]}
let g:ale_fix_on_save = 1
