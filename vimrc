" This vimrc is designed to improve my use of Vim to do Python and 
" Fortran programming, among other tasks. 

"***********************************************************************
" General settings *****************************************************
"***********************************************************************

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
filetype plugin on
set encoding=utf-8 

" Command to get crontab to work
"autocmd filetype crontab setlocal nobackup nowritebackup


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
Plugin 'vim-scripts/indentpython.vim'

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

"Syntastic has numerous options that can be configured. It is 
" recommended that you start by adding the following lines to your 
" vimrc, and return to them later as needed: 
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
"let g:syntastic_fortran_checkers



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
" Python syntax and other features ****************************************
"***********************************************************************
syntax on
filetype indent plugin off
"The following two lines can be added to source files.
"# vim: tabstop=8 expandtab shiftwidth=4 softtabstop=4
"set modeline
au FileType python setlocal tabstop=4 expandtab shiftwidth=4 softtabstop=4
au FileType python set formatoptions+=t
au FileType python set tw=79
"au FileType python set autoindent fileformat=unix encoding=utf-8

