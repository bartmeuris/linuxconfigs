" NeoBundle config: {{{
source ~/.vim/neobundlerc
" }}}

" Check out this for more for more inspiration:
" http://mg.pov.lt/vim/vimrc

" Important config: {{{
set modeline
set modelines=5

set cmdheight=1
set encoding=utf-8 " Necessary to show unicode glyphs
" }}}


" General Config: {{{
set number
set cursorline
set mouse=v
set nrformats-=octal
set wildmenu
set display+=lastline
set scrolloff=2
set autoread
set history=1000
set tabpagemax=50
set switchbuf=usetab,newtab

if v:version > 703 || v:version == 703 && has("patch541")
	set formatoptions+=j " Delete comment character when joining commented lines
endif
if &shell =~# 'fish$'
	set shell=/bin/bash
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

" Wrapping
"set showbreak=...
"
set backup
set backupdir=~/.vim/tmp

" Don't put swp files in pwd
if !isdirectory(&backupdir)
	exec 'silent !mkdir -p ' . &backupdir
endif
let &dir=&backupdir
if has("persistent_undo")
	set undofile
	let &undodir=&backupdir . '/.vimundo'
	if !isdirectory(&undodir)
		" create the undo directory if it doesn't already exist
		exec "silent !mkdir -p " . &undodir
	endif
endif

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
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
	nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif
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
try
	color pointless
catch /^Vim\%((\a\+)\)\=:E185/
	color default
endtry

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

let g:syntastic_enable_baloons = 1
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '✗'
"let g:syntastic_warning_symbol = '!'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = "☢"
"let g:syntastic_ok_symbol = '√'
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

" Leader tryout {{{
let mapleader = "\<Space>"
map <Leader>o :CtrlP<CR>
map <Leader><Leader> V

vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

map q: :q
" }}}

if has("digraphs")
	digraph -- 8212               " em dash
	digraph `` 8220               " left double quotation mark
	digraph '' 8221               " right double quotation mark
	digraph ,, 8222               " double low-9 quotation mark
endif
if has("linebreak")
  let &sbr = nr2char(8618).' '  " Show ↪ at the beginning of wrapped lines
endif

" Airline: {{{
"let g:airline_left_sep='▶'
"let g:airline_right_sep='◀'
let g:airline_detect_modified=1
let g:airline_detect_paste=1
let g:airline_powerline_fonts=1
let g:airline_theme='powerlineish'
set laststatus=2   " Always show the statusline

" }}}

" vim: set foldmethod=marker:
