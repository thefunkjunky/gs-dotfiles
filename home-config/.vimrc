" Most Customizations derived from
" https://realpython.com/blog/python/vim-and-python-a-match-made-in-heaven/


" Set leader key
let mapleader=" "

" Line numbers
set nu

" Move lines/selections up and down with Alt-k and Alt-j, respectively
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" Load pathogen and Vundle plugin managers

"execute pathogen#infect()
"syntax on
"filetype plugin indent on

"set nocompatible              " required
"filetype off                  " required

" set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
"
" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
" Plugin 'gmarik/Vundle.vim'


"
" " Add all your plugins here (note older versions of Vundle used Bundle
" instead of Plugin)

" Plugin 'tpope/vim-sensible'
" Plugin 'tmhedberg/SimpylFold'
" Plugin 'vim-scripts/indentpython.vim'
" Bundle 'Valloric/YouCompleteMe'
" Plugin 'scrooloose/syntastic'
" Plugin 'nvie/vim-flake8'
" Plugin 'jnurmine/Zenburn'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'scrooloose/nerdtree'
" Plugin 'jistr/vim-nerdtree-tabs'
" Plugin 'kien/ctrlp.vim'
" Plugin 'tpope/vim-fugitive'
" Plugin 'davidhalter/jedi-vim'
" Plugin 'jiangmiao/auto-pairs'
" Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"
"
" " All of your Plugins must be added before the following line
" call vundle#end()            " required
" filetype plugin indent on    " required

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za

" Python PEP8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|
    \ set textwidth=79|
    \ set expandtab|
    \ set autoindent|
    \ set fileformat=unix|
" Full Stack indentation
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2|
    \ set softtabstop=2|
    \ set shiftwidth=2|

" Mark unecessary whitespace
highlight BadWhitespace ctermbg=red guibg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Set encoding to UTF-8 (python 3)
set encoding=utf-8

" Customize YouCompleteMe autocomplete bundle
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF

let python_highlight_all=1
syntax on

" Color Scheme loading logic
if has('gui_running')
	set background=dark
	colorscheme solarized
"else
"	colorscheme zenburn
endif

" Switch Solarized light and dark with F5
"so ~/.vim/bundle/vim-colors-solarized/autoload/togglebg.vim
"call togglebg#map("<F5>")

" ignore .pyc in nerdtree 
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

