inoremap jj <Esc>

set clipboard+=unnamedplus
set exrc
"set guicursor=
set nu
set nohlsearch
set hidden
set noerrorbells
set smartindent
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set colorcolumn=80
set nocompatible              " be iMproved, required
" VUNDLESTUFF starts here

set clipboard+=unnamedplus
colo desert
syntax on
filetype plugin indent on
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'morhetz/gruvbox'
"Coc - note installed via vim v8 native plugin manager
"Set gruvbox colorscheme
autocmd vimenter * colorscheme gruvbox



call vundle#end()            " required
filetype plugin indent on    " required
