set autoindent
set nosmartindent
set tabstop=4
set shiftwidth=4
set showmatch
"set guioptions-=T
set vb t_vb=
set ruler
set printoptions=paper:letter,left:5pc,right:5pc,top:5pc,bottom:5pc,number:y
au VimLeave * :!clear

set guifont=Monaco:h12

if ! has("gui_running")
    set t_Co=256
endif
"set t_Co=256

syntax on
" feel free to choose :set background=light for a different style
if has('gui_running')
    set background=light
    colorscheme solarized  
else
    set background=dark
    colorscheme solarized
endif
"set background=dark
"let g:solarized_termcolors = 256
colorscheme solarized

" Status Line *****************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120

" Searching *******************************************************************
"set hlsearch  " highlight search
"set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

" Editing space options *********************************************** 
" Highlite last column to help keep text width reasonable
if exists('+colorcolumn')
    set colorcolumn=72
endif
" Display line numbers.
set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F5> :set nonumber!<CR>:set foldcolumn=0<CR>


" Python syntax and other featurs ****************************************
syntax on
filetype indent plugin on
"The following two lines can be added to source files.
"# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
"set modeline
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
