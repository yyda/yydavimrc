"--------------------------------------------------------------------------- 
" For pathogen.vim: auto load all plugins in .vim/bundle
"--------------------------------------------------------------------------- 
call pathogen#infect()

"--------------------------------------------------------------------------- 
" General Settings
"--------------------------------------------------------------------------- 
set nocompatible	" not compatible with the old-fashion vi mode
set bs=2		" allow backspacing over everything in insert mode
set history=50		" keep 50 lines of command line history

filetype on		" Enable filetype detection
filetype indent on 	" Enable filetype-specific indenting
filetype plugin on 	" Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

syntax on		" syntax highlight
set hlsearch		" search highlight

if has("gui_running")	" GUI color and font setting
	set guifont=osaka-mono:h20
	set background=dark
	set t_Co=256	" 256 colo mode 
	set cursorline	" highlight current line
	colors moria
else
	" terminal color settings
	colors vgod
endif

set clipboard=unnamed	" yank to the systme register (*) by default
set showmatch		" Cursor shows matching ) and }
set showmode		" Show current mode
set wildchar=<TAB>	" start wiid expasion in the command line
set wildmenu		" wild char completion menu

" ignore these files while expanding wild chars
set wildignore=*.o,*.class,*.pyc

set autoindent		" auto indentation
set incsearch		" incremental search
set nobackup		" no *~ backup files
set copyindent		" copy the previous indentation on autoindenting
set ignorecase 		" ignore case when searching
set smartcase 		" ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab 		" insert tabs on the start of a line according to context

" disable sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" TAB setting{
set expandtab 		" replace <TAB> with spaces
set softtabstop=3
set shiftwidth=3
au FileType Makefile set noexpandtab
" }

" status line {
set laststatus=2
set statusline=\ %{HasPaste()}%<%-15.25(%f%)%m%r%h\ %w\ \ 
set statusline+=\ \ \ [%{&ff}/%Y] 
"set statusline+=\ \ \ %<%20.30(%{hostname()}:%{CurDir()}%)\
set statusline+=\ \ \ %(%{CurDir()}%)\
set statusline+=%=%-10.(%l,%c%V%)\ %p%%/%L
" }

function! CurDir()
   let curdir = substitute(getcwd(), $HOME, "~", "")
   return curdir
endfunction

function! HasPaste()
   if &paste
      return '[PASTE]'
   else
      return ''
   endif
endfunction

" C/C++ specific settings
"autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,://cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------

"Plugin Shortcuts
"NERDTree 
nnoremap <silent> <F5> :NERDTree<CR>

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

"todo

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,big5,gb2312,latin1

fun! ViewUTF8()
   set encoding=utf-8
   set termencoding=big5
endfun

fun! UTF8()
   set encoding=utf-8
   set termencoding=big5
   set fileencoding=utf-8
   set fileencodings=ucs-bom,big5,utf-8,latin1
endfun

fun! Big5()
   set encoding=big5
   set fileencoding=big5
endfun

"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"--------------------------------------------------------------------------- 

"todo
