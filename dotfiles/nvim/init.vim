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
nnoremap cc :call system('pbcopy',getreg(0))<CR>
vnoremap <C-c> call system('pbcopy',getreg(0))
set clipboard+=unnamedplus
colo desert
syntax on
filetype plugin indent on
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plugin 'rust-lang/rust.vim'
Plug 'SirVer/ultisnips'

nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Install Omni for C Sharp 
Plug 'OmniSharp/omnisharp-vim'
Plug 'morhetz/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'leafgarland/typescript-vim'
Plug 'mbbill/undotree'
Plug 'lyuts/vim-rtags'
Plug 'vim-utils/vim-man'
Plug 'tomtom/tcomment_vim'
Plug 'neoclide/coc.nvim', {'do': { -> coc#util#install()}}
Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

" NERDTree Options
autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p
let NERDTreeShowHidden=0

Plug 'brooth/far.vim'
Plug 'evanleck/vim-svelte'
Plug 'maksimr/vim-jsbeautify'
" use <c-f> to beautify
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

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
Plug 'epilande/vim-es2015-snippets'

" React code snippets
Plug 'epilande/vim-react-snippets'

Plug 'w0rp/ale'
" Of course, Ale is only the glue between Vim and the actual syntax checker that runs under the hood, which in this case would be ESLint.

"Here's how to install ESLint:
" $ yarn add --dev eslint babel-eslint eslint-plugin-react
"and then configure it by runnning:

"$ eslint --init
"This will create an .eslintrc file, which you should check in to version control so that everybody is using the same style guide. You may want to have a chat with the other people working on your project, to make sure everybody agrees on which rules you¿ll enforce.

"Ale works out of the box with ESLint, so there¿s no further setup needed. However, I found Ale more pleasant to use with a couple tweaks in my vimrc:
"
"let g:ale_sign_error = '¿' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '.'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"
"For Prettier - 
"yarn add --dev prettier eslint-config-prettier eslint-plugin-prettier
Plug 'skywind3000/asyncrun.vim'
" Now, you should be able to run eslint --fix src/App.js, and src/App.js will be reformatted automatically.
" prettier command for coc to prettify on each save
" command! -nargs=0 Prettier :CocCommand prettier.formatFile
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'skywind3000/asyncrun.vim'

" Then run command
" autocmd BufWritePost *.js AsyncRun -post=checktime ./node_modules/.bin/eslint --fix %

"
Plug 'alvan/vim-closetag'
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

Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/$USER-wiki/',
                       \ 'syntax': 'markdown', 'ext': '.md',
					   \'path_html': '~/$USER-wiki-html/', 
					   \ 'custom_wiki2html': '~/dotfiles/stubin/wiki2html.sh'}]

autocmd FileType vimwiki call SetMarkdownOptions()

function! SetMarkdownOptions()
	call VimwikiSet('syntax', 'markdown')
	call VimwikiSet('custom_wiki2html', '~/dotfiles/stubin/wiki2html.sh')
endfunction

Plug 'mustache/vim-mustache-handlebars'
Plug 'sheerun/vim-polyglot'

autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList	   - lists configured plugins
" :PluginInstall	- installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean	  - confirms removal of unused plugins; append `!` to auto-approve removal

" LaTeX plugin
Plug 'lervag/vimtex'
" see :h vundle for more details or wiki for FAQ
" Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview'

Plug 'donRaphaco/neotex', { 'for': 'tex' }
let g:tex_flavor = 'latex'
autocmd Filetype tex setl updatetime=1
" Use mac's preview as the pdf viewr
let g:livepreview_previewer = 'open -a Preview' 
nmap <F12> :LLPStartPreview<cr>
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



" Put your non-Plugin stuff after this line
tnoremap jj  <C-\><C-n>
inoremap jj <esc>
set ignorecase
set smartcase
set splitright
set ai
set foldmethod=syntax
set shiftwidth=4
set softtabstop=4
set ts=4
" set spell spelllang=en_au
set spelllang=en_au
set nospell
" set number
set number

" Display a status-bar.
set laststatus=2

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Here begins my automated wordcount addition.
" This combines several ideas from:
" http://stackoverflow.com/questions/114431/fast-word-count-function-in-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:word_count="<unknown>"
function WordCount()
	return g:word_count
endfunction
function UpdateWordCount()
	let lnum = 1
	let n = 0
	while lnum <= line('$')
		let n = n + len(split(getline(lnum)))
		let lnum = lnum + 1
	endwhile
	let g:word_count = n
endfunction
" Update the count when cursor is idle in command or insert mode.
" Update when idle for 1000 msec (default is 4000 msec).
set updatetime=1000
augroup WordCounter
	au! CursorHold,CursorHoldI * call UpdateWordCount()
augroup END
" Set statusline, shown here a piece at a time
highlight User1 ctermbg=green guibg=green ctermfg=black guifg=black
set statusline=%1*			" Switch to User1 color highlight
set statusline+=%<%F			" file name, cut if needed at start
set statusline+=%M			" modified flag
set statusline+=%y			" file type
set statusline+=%=			" separator from left to right justified
set statusline+=\ %{WordCount()}\ words,
set statusline+=\ %l/%L\ lines,\ %P	" percentage through the file

" Converts current line into Title Case
nnoremap cT 0:s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g <CR>$
"change all angular double quotes to normal double quotes
nnoremap c" :%s/\(”\|“\)/"/g <CR>
" Toggle spellchecking
function! ToggleSpellCheck()
	set spell!
	if &spell
		echo "Spellcheck ON"
	else
		echo "Spellcheck OFF"
	endif
endfunction

nnoremap <silent> <Leader>Z :call ToggleSpellCheck()<CR>


" Search down into subfolders
set path+=** 
" Display all matching files when we tab complete
set wildmenu
" Uses vim surround to add italics and bold to md files ysii and ysiwh
" respectively -note that not using b because it's reserved for ) - so 'h' for
" heavy
autocmd FileType markdown,octopress let b:surround_{char2nr('i')} = "*\r*"
autocmd FileType markdown,octopress let b:surround_{char2nr('h')} = "**\r**"
"Replace all double quotes ¿ Quote¿ 
"	%s/¿\|¿/\"/g
"Replace all single quotes ¿ ¿ ¿
"	%s/¿\|¿/\'/g
" Move cursor to original position

nnoremap cQ :%s/¿\\|¿/\"/g <CR>
nnoremap cq :%s/\¿\\|\¿/\'/g <CR>
nnoremap cC :call coc#float#close_all()<CR>
" Take a link from the clipboard and create a link from current position to
" end of line
let @l ='bys$]%a(jjpa) jj'
" Open a split screen of current buffer - bind scroll and right screen have
" spell check on, left screen no ugly spell check.
let @f =':vs :set scrollbind :set nospell :set scrollbind <CR>'
let @f=':vs hjgg:set scrollbind:set nospell<CR>'
" This allow you to change a comma to a full stop and then capitalise the next
" first letter. 
let @e = 'Er.w~'
" set cursorline
" hi cursorline cterm=none term=none
" autocmd WinEnter * setlocal cursorline
" autocmd WinLeave * setlocal nocursorline
" highlight CursorLine guibg=#3b5070 ctermbg=234
highlight CursorLineNr gui=bold guifg=DarkRed guibg=#c0d0e0
" set hlsearch
let mapleader=" "
au BufRead,BufNewFile *.md "setlocal textwidth=80
function! SetupCommandAbbrs(from, to)
	exec 'cnoreabbrev <expr> '.a:from
				\ .' ((getcmdtype() ==# ":" && getcmdline() ==# "'.a:from.'")'
				\ .'? ("'.a:to.'") : ("'.a:from.'"))'
endfunction

" Use C to open coc config
call SetupCommandAbbrs('C', 'CocConfig')
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set shell=/bin/zsh
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>n  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>r  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>t :wincmd t<CR>
nnoremap <leader>b :wincmd b<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>w :exec 'resize ' . winheight('.')/2<CR>
nnoremap <leader>ps :Rg<CR>
"FZF fuzzyfind mappings - 
map <C-f> <Esc><Esc>:Files!<CR>
inoremap <C-f> <Esc><Esc>:Blines!<CR>
map <C-g> <Esc><Esc>:BCommits!<CR>



"These are bindings used to automate tasks for iQuanti project 
let @k='0d$imeta[name="keywords-primary" content="jjpA,,jj'
let @l='0d$imeta[name="keywords-secondary" content="jjpA,,jj'
let @u='0d$imeta[name="url" content="jjpA,,jj'
let @m='0df:d^"sd$dd0df:d^"td$iimg[src=""jjh"splli alt=""jjh"tpA,,jj'
let @x='yyjjPjjj'
let @y='0df:d^"sd$dd0df:d^"td$i![jj"tplr]a(jj"spj0'
let @i='0df>d^d$ih2,,jjpj0'
let @y='imeta[name="description" content="jj"*pA,,jj'

"Set gruvbox colorscheme
autocmd vimenter * colorscheme gruvbox

" -----------------------------------------------------------------------------
"  VIMTEX OPTIONS
"  ----------------------------------------------------------------------------
if has('unix')
	if has('mac')
		let g:vimtex_view_method = "skim"
		let g:vimtex_view_general_viewer
					\ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
		let g:vimtex_view_general_options = '-r @line @pdf @tex'

		" This adds a callback hook that updates Skim after compilation
		let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
		function! UpdateSkim(status)
			if !a:status | return | endif

			let l:out = b:vimtex.out()
			let l:tex = expand('%:p')
			let l:cmd = [g:vimex_view_general_viewer, '-r']
			if !empty(system('pgrep Skim'))
				call extend(l:cmd, ['-g'])
			endif
			if has('nvim')
				call jobstart(l:cmd + [line('.'), l:out, l:tex])
			elseif has('job')
				call job_start(l:cmd + [line('.'), l:out, l:tex])
			else
				call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
			endif
		endfunction
	else
		let g:latex_view_general_viewer = "zathura"
		let g:vimtex_view_method = "zathura"
	endif
elseif has('win32')

endif

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
	let g:vimtex_compiler_progname = 'nvr'
endif

" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""

" Can hide specifc warning messages from the quickfix window
" Quickfix with Neovim is broken or something
" https://github.com/lervag/vimtex/issues/773
let g:vimtex_quickfix_latexlog = {
			\ 'default' : 1,
			\ 'fix_paths' : 0,
			\ 'general' : 1,
			\ 'references' : 1,
			\ 'overfull' : 1,
			\ 'underfull' : 1,
			\ 'font' : 1,
			\ 'packages' : {
			\   'default' : 1,
			\   'natbib' : 1,
			\   'biblatex' : 1,
			\   'babel' : 1,
			\   'hyperref' : 1,
			\   'scrreprt' : 1,
			\   'fixltx2e' : 1,
			\   'titlesec' : 1,
			\ },
			\}
" Mappings for compiling Latex file
autocmd FileType tex nmap <buffer> <C-T> :!xelatex %<CR>
autocmd FileType tex nmap <buffer> T :!open -a Skim %:r.pdf<CR><CR>
if has("nvim")
	let g:python_host_prog = $HOME . "/.venv/bin/python"
	let g:python3_host_prog = $HOME . "/.venv/bin/python3"
endif
" Allow putting a new line in at cursor without entering insert mode -
" shift-enter
nmap <S-Enter> i<CR><Esc>
nmap <CR> o<Esc>
nnoremap <leader>W :Vimwiki2HTMLBrowse <CR>
nnoremap <leader>H :VimwikiAll2HTML <CR>
noremap <leader>u :w<Home>silent <End> !urlview<CR>

let g:ruby_host_prog="rvm system do neovim-ruby-host"
nnoremap <leader>rp :%smagic/[,!?.'"#-:()]//g<CR>
" VIMINSPECTOR BINDINGS
" mnemonic 'di' = 'debug inspect' (pick your own, if you prefer!)
let g:vimspector_enable_mappings = 'HUMAN'
" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text

xmap <Leader>di <Plug>VimspectorBalloonEval
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
" Omnisharp Coc C# Settings
"OmniSharp won't work without this setting
filetype plugin on

set tabstop=4
set shiftwidth=4
set expandtab

"Showmatch significantly slows down omnicomplete
"when the first match contains parentheses.
set noshowmatch

"Super tab settings
let g:SuperTabDefaultCompletionType = 'context'
let g:SuperTabContextDefaultCompletionType = "<c-x><c-o>"
let g:SuperTabDefaultCompletionTypeDiscovery = ["&omnifunc:<c-x><c-o>","&completefunc:<c-x><c-n>"]
let g:SuperTabClosePreviewOnPopupClose = 1

"don't autoselect first item in omnicomplete, show if only one item (for preview)
"remove preview if you don't want to see any documentation whatsoever.
set completeopt=longest,menuone,preview
let g:OmniSharp_server_use_mono = 1
"Move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"You might also want to look at the echodoc plugin
set splitbelow

" Get Code Issues and syntax errors
let g:syntastic_cs_checkers = ['syntax', 'semantic', 'issues']

"Set autocomplete function to OmniSharp (if not using YouCompleteMe completion plugin)
set omnifunc=OmniSharp#Complete

" Synchronous build (blocks Vim)
nnoremap <F5> :wa!<cr>:OmniSharpBuild<cr>
" Builds can also run asynchronously with vim-dispatch installed
nnoremap <leader>b :wa!<cr>:OmniSharpBuildAsync<cr>
" automatic syntax check on events (TextChanged requires Vim 7.4)
autocmd BufWritePost *.cs SyntasticCheck
autocmd BufWritePost *.cs SyntasticSetLoclist

" Automatically add new cs files to the nearest project on save
autocmd BufWritePost *.cs call OmniSharp#AddToProject()

"The following commands are contextual, based on the current cursor position.
nnoremap gd :OmniSharpGotoDefinition<cr>
nnoremap <leader>fi :OmniSharpFindImplementations<cr>
nnoremap <leader>ft :OmniSharpFindType<cr>
nnoremap <leader>fs :OmniSharpFindSymbol<cr>
nnoremap <leader>fu :OmniSharpFindUsages<cr>
"finds members in the current buffer
nnoremap <leader>fm :OmniSharpFindMembers<cr>
"cursor can be anywhere on the line containing an issue
nnoremap <leader>x  :OmniSharpFixIssue<cr>
nnoremap <leader>fx :OmniSharpFixUsings<cr>
nnoremap <leader>tt :OmniSharpTypeLookup<cr>
nnoremap <leader>dc :OmniSharpDocumentation<cr>

nnoremap <leader>rt :OmniSharpRunTests<cr>
nnoremap <leader>rf :OmniSharpRunTestFixture<cr>
nnoremap <leader>ra :OmniSharpRunAllTests<cr>
nnoremap <leader>rl :OmniSharpRunLastTests<cr>
nnoremap <leader>u <nop>

" Remove 'Press Enter to continue' message when type information is longer than one line.
set cmdheight=2

" Contextual code actions (requires CtrlP or unite.vim)
nnoremap <leader>ca :OmniSharpGetCodeActions<cr>
" Run code actions with text selected in visual mode to extract method
vnoremap <leader>ca :call OmniSharp#GetCodeActions('visual')<cr>


" rename with dialog
"nnoremap <leader>nm :OmniSharpRename<cr>
"nnoremap <F2> :OmniSharpRename<cr>:wa<cr>
nnoremap <F2> :OmniSharpRename<cr>
" rename without dialog - with cursor on the symbol to rename... ':Rename newname'
"command! -nargs=1 Rename :call OmniSharp#RenameTo("<args>")

" Force OmniSharp to reload the solution. Useful when switching branches etc.
nnoremap <leader>rl :OmniSharpReloadSolution<cr>
nnoremap <leader>cf :OmniSharpCodeFormat<cr>
" Load the current .cs file to the nearest project
nnoremap <leader>tp :OmniSharpAddToProject<cr>

" (Experimental - uses vim-dispatch or vimproc plugin) - Start the omnisharp server for the current solution
nnoremap <leader>ss :OmniSharpStartServer<cr>
nnoremap <leader>sp :OmniSharpStopServer<cr>

" Add syntax highlighting for types and interfaces
nnoremap <leader>th :OmniSharpHighlightTypes<cr>
"Don't ask to save when changing buffers (i.e. when jumping to a type definition)
"
"extract text selected in visual mode as variable
vnoremap <leader>ev cvariable<esc>O<esc>pIvar variable = <esc>A;<esc>==w<F2>
set hidden
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ?
      \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    let g:coc_snippet_next = '<tab>'

let g:OmniSharp_selector_ui = 'fzf'    " Use fzf
nnoremap <silent> <Leader>f :Ag<CR>
