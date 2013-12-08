set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" Bundle 'gmarik/vundle'

Bundle 'vim-ruby/vim-ruby'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-surround'
Bundle 'airblade/vim-gitgutter'
Bundle 'bling/vim-airline'
Bundle 'edkolev/tmuxline.vim'
Bundle 'tomtom/tcomment_vim'

" #########################
" Settings
" #########################

set encoding=utf-8
syntax on
filetype indent plugin on

set autoindent
set nu
set ruler
set hidden
set wildmenu
set hlsearch

set cursorline
set showcmd     " Display incomplete commands.
set showmode    " Display the mode you're in.
set showmatch   " Show matching brackets/parenthesis

set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set showbreak=↪

set title " Set the terminal's title

set wildmode=list:longest " Complete files like a shell.
set wildmenu " Enhanced command line completion.
set wildignore=*.o,*.obj,*~ " Stuff to ignore when tab completing

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

set laststatus=2

"Indentation settings
set shiftwidth=2
set softtabstop=2
set expandtab

" Plugins
let g:ctrlp_map = '<c-d>' " Remap ctrl + p to ctrl + d

" Theme settings
set t_Co=256 " Set terminal colors to 256
set background=dark
colorscheme solarized "Set colorscheme to solarized

" ####################
" Remaps
" ###################


" Insert blank lines without going into insert mode
nmap go o<esc>
nmap gO O<esc>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" ctrlp.vim
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " for Linux/MacOSX
set wildignore+=*/tmp/*,*.so,*.swp,*.zip


nnoremap <esc> :noh<return><esc> " Clear last search highlighting


" Plugin customization

let g:airline_powerline_fonts = 1


" ################
" Functions
" ################

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
command -nargs=0 -bar Update if &modified
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif
inoremap <c-s> <Esc>:Update<CR>
