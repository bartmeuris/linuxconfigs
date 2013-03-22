"set vb ai aw ts=8 sw=8 report=2 sm ruler showmode noic writeany mouse=a nowrap

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
"Bundle 'Valloric/YouCompleteMe'

"Bundle 'tpope/vim-fugitive'
"Bundle 'Lokaltog/vim-easymotion'
"Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
"Bundle 'tpope/vim-rails.git'
"Bundle 'L9'
"Bundle 'FuzzyFinder'

filetype plugin indent on

set encoding=utf-8
set t_Co=256 "enable 256 colors
set background=dark
"
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
"call pathogen#helptags()

filetype plugin indent on

autocmd FileType python set expandtab
autocmd FileType html,htmldjango,jinjahtml,eruby,mako let b:closetag_html_style=1
autocmd FileType html,xhtml,xml,htmldjango,jinjahtml,eruby,mako source ~/.vim/bundle/closetag/plugin/closetag.vim
autocmd FileType md,markdown source ~/.vim/syntax/mkd.vim

let g:SuperTabDefaultCompletionType = "context"

set statusline+=%{SyntasticStatuslineFlag()}

let g:tagbar_usearrows = 1

nnoremap <leader>l :TagbarToggle<CR>

"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'compatible'

set nocompatible				" No compatible mode
set hlsearch					" Highlight search pattern
set autoindent					" Auto indent
set smartindent					" Smart indent
set autowrite					" Autowrite when switching files
set tabstop=4					" Tabstop to 4
set shiftround					" Shiftround
set shiftwidth=4				" Shiftround characters to 4 = tabstop
set report=2					" Report if more than 2 lines were changed by a command
set showmatch					" Show bracket matching
set ruler						" Show cursor position
set noignorecase				" no ignore cas in search
set writeany					" no ! needed for overwriting files
set mouse=						" mouse mode to all
set nowrap						" no wrapping of lines
set sidescroll=1				" Side scroll to 1 character, and not a whole screen
set noerrorbells				" No irritating beeps
set scrolloff=4					" ?? 
set laststatus=2				" ??
set showbreak=>					" Character to display at eol when line is too long
set matchpairs+=<:>				" add '<' and '>' as pairs to match
set showmode					" ??
"set statusline=%<%f%y%r%m%=[%l,%2c][%07O,%3b/%2B]\ %P
set backspace=indent,eol,start	" Backspace behavior
set wildmenu					" enhanced open and saving browsing...
set suffixes+=.class			" suffixes with low priority in file list
set novisualbell				" No irritating visual bell in PuTTY
set incsearch					" Incremental search
set gdefault					" Add the /g option by default for the substitute command
set ignorecase					" Ignore case while searching
set smartcase					" Don't ignore case when the search pattern contains upper-case characters
set sidescroll=5				" minimum sidescrolling: 5 is reasonable for slower ssh connections
set listchars=eol:$,tab:>_,precedes:>,trail:#	" characters to set in list mode

set tags+=~/tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags
set tags+=../../../../tags

"let g:ctags_title=1
"let g:ctags_statusline=1
"let generate_tags=1

" Syntax coloring
let color = "true"
if has("syntax")
    if color == "true"
		" This will switch colors ON
		so ${VIMRUNTIME}/syntax/syntax.vim
		colorscheme elflord
    else
		" this switches colors OFF
		syntax off
		set t_Co=0
    endif
endif

set directory='~/.vim/swap,~/tmp,/var/tmp,/tmp'

"colorscheme pointless
