" This vimrc is designed to improve my use of Vim to do Python and 
" Fortran programming, among other tasks. 

"***********************************************************************
" General settings *****************************************************
"***********************************************************************

" configure editor with tabs and nice stuff...
set nosmartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4    " number of spaces to use for auto indent
set autoindent      " copy indent from current line when starting a new line
set smarttab
set showmatch
set vb t_vb=
set printoptions=paper:letter,left:5pc,right:5pc,top:5pc,bottom:5pc,number:y,syntax:y
au VimLeave * :!clear
set formatoptions+=w
au FileType gitcommit setlocal tw=72


" make backspaces more powerfull
set backspace=indent,eol,start

set nocompatible        " required
filetype off            " required
filetype plugin on
set encoding=utf-8 

" Command to get crontab to work
"autocmd filetype crontab setlocal nobackup nowritebackup


"***********************************************************************
" Splits settings ******************************************************
"***********************************************************************

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"***********************************************************************
" Vundle Plugins  ******************************************************
"***********************************************************************
" I am using the plugin manager Vundle.vim. I learned about this from an
" article on Real Python titled "VIM and Python – A Match Made in 
" Heaven", which is about how to set up a powerful VIM environment that 
" is geared towards wrangling Python. See:
"
" https://realpython.com/vim-and-python-a-match-made-in-heaven/#lets-make-an-ide
"
" Vundle will allow me to easily manage a number of useful plugins.


" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here 
" vim-airline creates an info line at the bottom of the vim window.
" Desciption of vim-airline: https://github.com/vim-airline/vim-airline
" Detail documentation: 
"     https://github.com/vim-airline/vim-airline/blob/master/doc/airline.txt
Plugin 'vim-airline/vim-airline'    
Plugin 'vim-airline/vim-airline-themes'

" indentpython is a script that tries to implement the indention
" practices suggested in PEP 8.
" Script url: https://github.com/vim-scripts/indentpython.vim
" PEP 8 documenation: http://www.python.org/peps/pep-0008.html
"Plugin 'vim-scripts/indentpython.vim'

" Syntastic is a syntax checking plugin. Syntastic can check the
" syntax of Fortran and Python code, among many others. 
" Description: https://github.com/vim-syntastic/syntastic
" Documentation: 
"     https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic.txt
" Checker documentation:
"     https://github.com/vim-syntastic/syntastic/blob/master/doc/syntastic-checkers.txt
Plugin 'vim-syntastic/syntastic'

" NERDtree is a plugin that provides a file browser.
" Description/documentation: https://github.com/preservim/nerdtree
Plugin 'preservim/nerdtree'

" vim-fugitive is a plugin for git that provides additional git details 
" and controls within vim.
" Description/documentation: https://github.com/tpope/vim-fugitive
Plugin 'tpope/vim-fugitive'    

" vim-gitgutter shows signs for line additions (+), modifications (~), 
" or removals (-) in the vim window gutter if the file you’re modifying 
" is in a git repo.
" Description: https://github.com/airblade/vim-gitgutter
Plugin 'airblade/vim-gitgutter'    

" Indent Guides is a plugin for visually displaying indent levels in Vim.
" Description/documentation: https://github.com/nathanaelkane/vim-indent-guides
Plugin 'nathanaelkane/vim-indent-guides'

" vim-python-pep8-indent modifies indentation behaviour to match PEP 8. 
" This is an alternative to vim-scripts/indentpython.vim.
" Description: https://github.com/Vimjas/vim-python-pep8-indent
Plugin 'Vimjas/vim-python-pep8-indent'

" rainbow helps you read complex code by showing different levels of 
" parentheses in different colors !!
Plugin 'luochen1990/rainbow'

" Plugins to manage buffers
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jeetsukumaran/vim-buffergator'

" ****************
" Markdown plugins
" ****************
Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

" *********************
" Writing Prose plugins
" *********************

" Rethinking vim as a writing tool.
" Instructions: https://github.com/preservim/vim-pencil
Plugin 'reedes/vim-pencil'

" Find duplicates (dittos) in text.
" Instructions: https://github.com/dbmrq/vim-ditto
Plugin 'dbmrq/vim-ditto'    

" Find trite phrases and other style problems.
" Instructions: https://github.com/preservim/vim-wordy
Plugin 'preservim/vim-wordy'

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
 

"***********************************************************************
" Plugin settings ******************************************************
"***********************************************************************

" ********************
" vim-airline settings 
" ********************

" I am using vim-airline, which creates a line at the bottom of the 
" screen in which useful information is displayed. Vim-airline is 
" installed and managed by Vundle above.
"
" I don't want vim-airline to tell me about white spaces. I couldn't 
" care less about trailing white spaces. I have better things to worry
" about when programming.
let g:airline#extensions#whitespace#enabled=0

" The following is from https://github.com/vim-airline/vim-airline/issues/2381#issuecomment-940825425
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr="\u33c7" 

" For git status line:
let g:airline#extensions#hunks#enabled = 1
let g:airline#extensions#tabline#enabled = 1

"let g:airline_section_x = ''
"let g:airline_section_y = ''
"let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'

let g:airline#extensions#syntastic#enabled=1

" Status line for vim-pencil
let g:airline_section_x = '%{PencilMode()}'

" ******************
" syntastic settings
" ******************

"Syntastic has numerous options thatcan be configured. It is 
" recommended that you start by adding the following lines to your 
" vimrc, and return to them later as needed: 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
"let g:syntastic_fortran_checkers
let g:syntastic_python_flake8_args=
    \ '--ignore=E127,E126,E225,E226,W291,W293,E302,W503,E303,E231,E261'
"let g:syntastic_python_pylint_args='--ignore='
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
" let g:syntastic_style_error_symbol = "✗" 
" let g:syntastic_style_warning_symbol = "⚠"

" Start with no syntastic. 
" To enable syntastic, type 'Ctrl-w e'.
" To disenable, type 'Ctrl-w d'.
let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes':   [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>d :SyntasticToggleMode<CR>

" **********************
" vim-gitgutter settings 
" **********************
set updatetime=100    " Update time for vim-gitgutter


" *****************
" NERDTree settings
" *****************

map <C-n> :NERDTreeToggle <CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeHijackNetrw=0
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p


" *********************
" indent guide settings
" *********************
let g:indent_guides_guide_size = 0
let g:indent_guides_color_change_percent = 3
let g:indent_guides_enable_on_vim_startup = 1


" **************************
" buffer management settings
" **************************

"let g:ctrlp_map = '<c-p>'
"let g:ctrlp_cmd = 'CtrlP'

"" CtrlP settings.
"" Setup some default ignores
"let g:ctrlp_custom_ignore = {
"  \ 'dir':  '\v[\/](\.(git|hg|svn)|\_site)$',
"  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
"\}
"" Use the directory of the current file as the cwd
"let g:ctrlp_working_path_mode = 'c'
"" Use a leader instead of the actual named binding
"nmap <leader>p :CtrlP<cr>
"" Easy bindings for its various modes
"nmap <leader>bb :CtrlPBuffer<cr>
"nmap <leader>bm :CtrlPMixed<cr>
"nmap <leader>bs :CtrlPMRU<cr>


" *******************
" Buffergate settings
" *******************

" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'
"" I want my own keymappings...
"let g:buffergator_suppress_keymaps = 1
"" Looper buffers
""let g:buffergator_mru_cycle_loop = 1
"" Go to the previous buffer open
"nmap <leader>jj :BuffergatorMruCyclePrev<cr>
"" Go to the next buffer open
"nmap <leader>kk :BuffergatorMruCycleNext<cr>
"" View the entire list of buffers open
"nmap <leader>bl :BuffergatorOpen<cr>
"" Shared bindings from Solution #1 from earlier
"nmap <leader>T :enew<cr>
"nmap <leader>bq :bp <BAR> bd #<cr>


" ***********************
" Markdown files settings
" ***********************

au! BufRead,BufNewFile *.markdown set filetype=mkd
au! BufRead,BufNewFile *.md       set filetype=mkd
let g:vim_markdown_folding_disabled = 1


" *******************
" vim-pencil settings
" *******************
let g:pencil#wrapModeDefault = 'soft'
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md call pencil#init()
    autocmd FileType text            call pencil#init()
augroup END

" *********************
" Misc. Plugin Settings
" *********************

" rainbow plugin settings
"set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_active = 1 


"***********************************************************************
" Syntax and appearance ************************************************
"***********************************************************************

" This section covers settings to get Vim and code in Vim to be legible
" and enjoyable to read.
"

" Let's get formatting and syntax correct for Fortran and Python.
let fortran_free_source=1
let python_highlight_all=1
syntax on

" Now I will set the Vim colorschme, the syntax colorscheme, the
" vim-airline theme, and a few other items. The settings will depend on
" whether I am running Vim in the terminal or a GUI based Vim, like
" GVim.
if has('gui_running')
    set guifont=Fira_Code:h16
    set background=light
    let g:two_firewatch_italics=1
    colorscheme two-firewatch
    let g:airline_theme='sol'
    let g:airline_powerline_fonts = 1
else
    set background=dark
"     let g:two_firewatch_italics=0
"     colorscheme two-firewatch
    let g:airline_theme='sol'
    "let g:airline_theme='papercolor'
    let g:airline_powerline_fonts = 1
    set guifont=Fira_Code:h16
endif

"***********************************************************************
" Status Line **********************************************************
"***********************************************************************
set showcmd
set ruler " Show ruler
"set ch=2 " Make command line two lines high
"match LongLineWarning '\%120v.*' " Error format when a line is longer than 120


"***********************************************************************
" Searching ************************************************************
"***********************************************************************
"set hlsearch  " highlight search
"set incsearch  " Incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase

"***********************************************************************
" Editing space options *********************************************** 
"***********************************************************************
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


"***********************************************************************
" Python syntax and other features *************************************
"***********************************************************************
syntax on
filetype indent on
"The following two lines can be added to source files.
"# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
"set modeline
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType python set formatoptions+=t
au FileType python set tw=79
"au FileType python set autoindent fileformat=unix encoding=utf-8

" configure expanding of tabs 
au BufRead,BufNewFile *.py set expandtab


