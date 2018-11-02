set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'VundleVim/Vundle.vim'

" Insert Plugins here
Plugin 'itchyny/lightline.vim'
Plugin 'tomtom/tcomment_vim'
Plugin 'sjl/badwolf'

call vundle#end()
filetype plugin indent on

syntax on
colo badwolf
set hidden
set wildmenu
set showcmd
set hlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
set mouse=a
set cmdheight=2
set number
set notimeout ttimeout ttimeoutlen=200

set shiftwidth=4
set softtabstop=4
set expandtab
