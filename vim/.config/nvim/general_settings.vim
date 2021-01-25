filetype off
syntax on

set number
set hidden
set hlsearch
set showmatch   " Show matching brackets/parenthesis
set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set showbreak=↪
set title " Set the terminal's title
set scrolloff=10
set mouse=

" Wildmenu completition {{{
set wildmode=list:longest " Complete files like a shell.
set wildignore=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Version Control
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*/coverage/*
set wildignore+=*/node_modules/*,*/bower_components/* " Package Control
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" }}}

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Indentation settings
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set expandtab

" Make sure that comments are automatically wrapped at 'textwidth'.
" See :help fo-table for details on the options.
set textwidth=78
set formatoptions=jcroq

" Disable backups
set noswapfile
set nobackup
set nowritebackup

set spelllang=en,de

" Split settings
set splitbelow
set splitright

" Highlight search & replace
set inccommand=split

" Disable menu, and other GUI elements
set guioptions=c

" This should make drawing the window 9000 times faster
set ttyfast
set lazyredraw
set regexpengine=2

" More frequent updates for, e.g. signs.
set updatetime=800

" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256

" Don't syntax highlight long lines
set synmaxcol=256

" Undo settings, to make undo persistent
set undofile
set undodir=$HOME/.config/nvim/undo
set undolevels=1000
set undoreload=10000

" Theme settings
set termguicolors
let g:dracula_colorterm = 0
colorscheme dracula

set cursorline
highlight clear CursorLine

set fillchars=vert:\│,stlnc:\ ",stl:\ "
set laststatus=2
set statusline=\ \ %L%*        " Total rownumber
set statusline+=\ %f\           " File+path

command! Gblame :GitMessenger

" Leader
let g:mapleader = ','
let g:maplocalleader = "\\"

set signcolumn=yes
