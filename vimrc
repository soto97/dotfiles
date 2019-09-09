set nosmartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set showmatch
set vb t_vb=
set ruler
set printoptions=paper:letter,left:5pc,right:5pc,top:5pc,bottom:5pc,number:y,syntax:y
au VimLeave * :!clear

set nocompatible        " required
filetype off            " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'vim-scripts/indentpython.vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" ...

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" Command to get crontab to work
"autocmd filetype crontab setlocal nobackup nowritebackup

if has('gui_running')
  set guifont=Menlo:h15
endif

let fortran_free_source=1
let python_highlight_all=1
syntax on

" Nrw that I am using vim-airline, I don't want it to tell me about white
" spaces. I couldn't care less about trailing white spaces. I have better
" things to worry about when programming.
let g:airline#extensions#whitespace#enabled=0

if has('gui_running')
     set background=light " or light if you prefer the light version
     let g:two_firewatch_italics=1
     colorscheme two-firewatch
     let g:airline_theme='sol'
 else
     set background=dark
"     let g:two_firewatch_italics=0
"     colorscheme two-firewatch
     let g:airline_theme='sol'
     let g:airline_powerline_fonts = 1
endif     


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
" Highlight last column to help keep text width reasonable
if has('gui_running')
    if exists('+colorcolumn')
        set colorcolumn=72
    endif
endif
" Display line numbers.
set number
" Toggle line numbers and fold column for easy copying:
nnoremap <F5> :set nonumber!<CR>:set foldcolumn=0<CR>


" Python syntax and other featurs ****************************************
syntax on
"filetype indent plugin off
"The following two lines can be added to source files.
"# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
"set modeline
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType python set formatoptions+=t
au FileType python set tw=79
au FileType python set autoindent fileformat=unix encoding=utf-8

map <C-n> :NERDTreeToggle <CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
