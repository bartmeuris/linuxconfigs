" Vundle: {{{
set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" :BundleInstall
" or run
" vim +BundleInstall +qall
Bundle 'gmarik/vundle'

Bundle 'Lokaltog/vim-powerline'
"Bundle 'bling/vim-airline' " New/better powerline alternative? https://github.com/bling/vim-airline
"Bundle 'itchyny/lightline.vim' " Another powerline alternative: https://github.com/itchyny/lightline.vim

Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/syntastic'
Bundle 'cnf/vim-pointless'
Bundle 'scrooloose/nerdtree'
Bundle 'vim-scripts/taglist.vim'
Bundle 'majutsushi/tagbar'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-sleuth'
Bundle 'kien/ctrlp.vim'

"Bundle 'vim-scripts/TabBar'

"Bundle 'hynek/vim-python-pep8-indent'
"Bundle 'tpope/vim-markdown'
"Bundle 'tomtom/tcomment_vim'
"Bundle 'rodjek/vim-puppet'
"Bundle 'Glench/Vim-Jinja2-Syntax'
"Bundle 'airblade/vim-gitgutter'
"Bundle 'msanders/snipmate.vim'
"Bundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on
"}}}

" General Config: {{{
set nocompatible   " Disable vi-compatibility
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show unicode glyphs


set number
"set relativenumber
set cursorline
set mouse=v

if v:version >= 703
	"undo settings
	set undodir=~/.vim/undofiles
	set undofile
endif

" jump to last cursor position when opening a file
" dont do it when writing a commit log entry
autocmd BufReadPost * call SetCursorPosition()
function! SetCursorPosition()
	if &filetype !~ 'svn\|commit\c'
		if line("'\"") > 0 && line("'\"") <= line("$")
			exe "normal! g`\""
			normal! zz
		endif
	endif
endfunction

set statusline+=%{SyntasticStatuslineFlag()}
set autowrite	" Autowrite when switching files
set tags+=~/tags
set tags+=../tags
set tags+=../../tags
set tags+=../../../tags
set tags+=../../../../tags

set backspace=indent,eol,start

set matchpairs+=<:>		" add '<' and '>' as pairs to match
set formatoptions-=o
set modelines=5

" Wrapping
"set showbreak=...

" Don't put swp files in pwd
set dir='~/.vim/swp,~/tmp,/var/tmp,/tmp'

"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

set pastetoggle=<f5>

set nomesg                          " because being talked to during an edit is aggravating

" }}}

" Folding configuration: {{{

set foldmethod=indent
set foldnestmax=3
set nofoldenable " No folding by default

" }}}

" Key configuration: {{{

nnoremap <f2> :NERDTreeToggle<cr>
nnoremap <f3> :TagbarToggle<cr>
nnoremap <C-b> :CtrlPBuffer<cr>

" }}}

" Tab Config: {{{
set tabstop=4
set softtabstop=4
set shiftwidth=4
"set expandtab
set autoindent
set smartindent
"set cindent
set smarttab

autocmd FileType ruby setlocal ts=2 sts=2 sw=2
autocmd FileType html setlocal ts=2 sts=2 sw=2
autocmd FileType json setlocal ts=2 sts=2 sw=2
" }}}

" Search Related: {{{
set ignorecase                      " search case insensitive
set smartcase                       " unless search contains caps
set incsearch                       " Show matches while typing
set hlsearch                        " When there is a previous search pattern, highlight all its matches
" }}}

" Show Invisible Characters: {{{
set list
set listchars=tab:▸\ ,trail:⋅,nbsp:⋅
"set listchars=tab:▸\ ,eol:¬
" :highlight ExtraWhitespace ctermbg=red guibg=red
" autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/
" }}}

" Show Syntax Colors: {{{
syntax enable
set t_Co=256 "enable 256 colors
set background=dark
color pointless

au! BufNewFile,BufRead Vagrantfile set filetype=ruby
au! BufNewFile,BufRead *.json set ft=javascript
" }}}

" PowerLine: {{{
" :PowerlineClearCache
"let g:Powerline_symbols = 'fancy'
let g:Powerline_symbols = 'unicode'
" }}}

" Syntastic: {{{
let g:syntastic_c_compiler = 'clang'
let g:syntastic_cpp_compiler = 'clang++'

"let g:syntastic_c_checkers = [ "gcc" ]
"let g:syntastic_cpp_checkers = [ "gcc" ]

"let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_enable_highlighting = 1


let g:syntastic_mode_map = {
	\ 'mode': 'active',
	\ 'active_filetypes': ['ruby', 'php', 'c', 'cpp', 'golang', 'go' ],
	\ 'passive_filetypes': ['puppet']
	\ }
" }}}

" Development: {{{
" Show syntax highlighting groups for word under cursor
"map <F3> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">" . " FG:" . synIDattr(synIDtrans(synID(line("."),col("."),1)),"fg#")<CR>
" }}}

" Python config {{{
autocmd FileType python set expandtab
" }}}

" Markdown: {{{
autocmd FileType md,markdown source ~/.vim/syntax/mkd.vim
autocmd FileType md,markdown set expandtab
" }}}

" vim: set foldmethod=marker : "
