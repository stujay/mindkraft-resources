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


Plugin 'mbbill/undotree'
Plugin 'lyuts/vim-rtags'
Plugin 'vim-utils/vim-man'
Plugin 'tomtom/tcomment_vim'

Plugin 'evanleck/vim-svelte'
Plugin 'maksimr/vim-jsbeautify'
" use <c-f> to beautify
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

Plugin 'godlygeek/tabular'

Plugin 'gabrielelana/vim-markdown'

Plugin 'vim-pandoc/vim-pandoc'

Plugin 'tpope/vim-surround'
" Added by Jay 
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" Example for emmet-vim
" add this line to your .vimrc file
Plugin 'mattn/emmet-vim'
" Redefine Emmet Key
let g:user_emmet_leader_key=','
" %h2#tagline.hero-text
" will result in
" <h2 id="tagline" className="hero-text"></h2>

" let g:user_emmet_leader_key='<C-y>'

let g:user_emmet_settings = {
  \  'javascript.jsx' : {
    \      'extends' : 'jsx',
    \  },
  \}

Plugin 'w0rp/ale'

Plugin 'prettier/vim-prettier', { 'do': 'yarn install' }

Plugin 'skywind3000/asyncrun.vim'

" Then run command
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

"
Plugin 'alvan/vim-closetag'
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'
" All of your Plugins must be added before the following line

Plugin 'mustache/vim-mustache-handlebars'
Plugin 'sheerun/vim-polyglot'

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList	   - lists configured plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean	  - confirms removal of unused plugins; append `!` to auto-approve removal


Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'

" Markdown viewer for browser
Plugin 'MikeCoder/markdown-preview.vim'
Plugin 'jiangmiao/auto-pairs'

" Install vim-Go plugin for Golang
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Vimspector Debugging
Plugin 'puremourning/vimspector'
call vundle#end()            " required
filetype plugin indent on    " required
