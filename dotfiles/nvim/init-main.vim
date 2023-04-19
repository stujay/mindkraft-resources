" set up by Stu Jay Raj
set nocompatible              " be iMproved, required
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
" set wrap
" set linebreak
set nolist
set clipboard+=unnamedplus
colo desert
syntax on
filetype plugin indent on

" Plugin Section 
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'

" Install Omni for C Sharp 
Plug 'OmniSharp/omnisharp-vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'lyuts/vim-rtags'
Plug 'vim-utils/vim-man'
Plug 'tomtom/tcomment_vim'
" Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}
Plug 'brooth/far.vim'
Plug 'evanleck/vim-svelte'
Plug 'maksimr/vim-jsbeautify'
Plug 'tmhedberg/matchit'
" Matching allows matching of tags - use o and O in visual

Plug 'tpope/vim-fugitive'

" Git plugin not hosted on GitHub
Plug 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.

Plug 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

Plug 'godlygeek/tabular'

Plug 'gabrielelana/vim-markdown'

Plug 'vim-pandoc/vim-pandoc'

Plug 'tpope/vim-surround'
" Added by Jay 
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Example for emmet-vim
" add this line to your .vimrc file
Plug 'mattn/emmet-vim'
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

Plug 'w0rp/ale'
Plug 'skywind3000/asyncrun.vim'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'skywind3000/asyncrun.vim'
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'
Plug 'mustache/vim-mustache-handlebars'
Plug 'sheerun/vim-polyglot'
Plug 'lervag/vimtex'
" see :h vundle for more details or wiki for FAQ
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview'

Plug 'donRaphaco/neotex', { 'for': 'tex' }
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown viewer for browser
Plug 'MikeCoder/markdown-preview.vim'
Plug 'jiangmiao/auto-pairs'

" Install vim-Go plugin for Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Vimspector Debugging
Plug 'puremourning/vimspector'
call plug#end()
