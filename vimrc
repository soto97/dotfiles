set nosmartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
"set tw=79
"set formatoptions+=t
"set guioptions-=T
set vb t_vb=
set ruler
set printoptions=paper:letter,left:5pc,right:5pc,top:5pc,bottom:5pc,number:y,syntax:y
au VimLeave * :!clear

" Command to get crontab to work
"autocmd filetype crontab setlocal nobackup nowritebackup

set guifont=Monaco:h13

if ! has("gui_running")
    set t_Co=256
endif
"set t_Co=256

syntax on
" feel free to choose :set background=light for a different style
"if has('gui_running')
"    let g:solarized_contrast="high"
"    set background=light
"    colorscheme solarized  
"else
"    set background=dark
"    colorscheme solarized
"endif
"let g:solarized_termcolors = 256

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
filetype indent plugin off
"The following two lines can be added to source files.
"# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
"set modeline
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4
au FileType python set formatoptions+=t
au FileType python set tw=79

