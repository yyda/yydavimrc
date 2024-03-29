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
autocmd FileType c,cpp,cc set cindent comments=sr:/*,mb:*,el:*/,://cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30

"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif


"---------------------------------------------------------------------------
" USEFUL SHORTCUTS
"---------------------------------------------------------------------------

" set leader to ,
let mapleader=","
let g:mapleader=","

" ,/ turn off search highlighting
nmap <leader>/ :nohl<CR>

" move around tabs. conflict with the original screen top/bottom
" comment them out if you want the original H/L
" go to prev tab
map <S-H> gT
" go to next tab
map <S-L> gt

" new tab
map <C-t><C-t> :tabnew<CR>
" close tab
map <C-t><C-w> :tabclose<CR> 

"---------------------------------------------------------------------------
" PROGRAMMING SHORTCUTS
"--------------------------------------------------------------------------- 

" Ctrl-[ jump out of the tag stack (undo Ctrl-])
map <C-[> <ESC>:po<CR>

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" use syntax complete if nothing else available
if has("autocmd") && exists("+omnifunc")
  autocmd Filetype *
              \	if &omnifunc == "" |
              \		setlocal omnifunc=syntaxcomplete#Complete |
              \	endif
endif

" make CSS omnicompletion work for SASS and SCSS
autocmd BufNewFile,BufRead *.scss             set ft=scss.css
autocmd BufNewFile,BufRead *.sass             set ft=sass.css

"---------------------------------------------------------------------------
" ENCODING SETTINGS
"--------------------------------------------------------------------------- 

set encoding=utf8
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

" --- SuperTab
let g:SuperTabDefaultCompletionType = "context"

"NERDTree 
nnoremap <silent> <F5> :NERDTree<CR>

