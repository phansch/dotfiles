set nocompatible              " be iMproved
filetype off                  " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" Bundle 'gmarik/vundle'

" Plugins {{{
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
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'tomtom/tlib_vim'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kchmck/vim-coffee-script'

" }}}
" Settings {{{
set encoding=utf-8
syntax on
filetype indent plugin on

set autoindent
set nu
set ruler
set hidden
set laststatus=2
set hlsearch
set cursorline
set showcmd     " Display incomplete commands.
set showmode    " Display the mode you're in.
set showmatch   " Show matching brackets/parenthesis
set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set showbreak=↪
set title " Set the terminal's title
set scrolloff=10
autocmd BufNewFile,BufReadPost *.coffee setl foldmethod=indent

" Wildmenu completition {{{
set wildmenu
set wildmode=list:longest " Complete files like a shell.
set wildignore=*.o,*.obj,*.exe,*.dll,*.manifest " Compiled object files
set wildignore+=*/.git/*,*/.hg/*,*/.svn/* " Version Control
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg   " binary images
" }}}

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

"Indentation settings
set shiftwidth=2
set softtabstop=2
set expandtab

" Theme settings
set t_Co=256 " Set terminal colors to 256
set background=dark
colorscheme solarized "Set colorscheme to solarized

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

" Leader
let mapleader = ","
let maplocalleader = "\\"
" }}}
" Line Return {{{

" Make sure Vim returns to the same line when you reopen a file.
" Thanks, Amit
augroup line_return
    au!
    au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif
augroup END

" }}}
" Remaps {{{

" Disable arrow keys
no <down> <nop>
no <left> <nop>
no <right> <nop>
no <up> <nop>

ino <down> <nop>
ino <left> <nop>
ino <right> <nop>
ino <up> <nop>

" Disable help key.
noremap  <F1> <nop>
inoremap <F1> <nop>

imap <leader>i <esc>
nnoremap <leader>s :w<cr>
nnoremap <leader>q :q<cr>

" Plugins
let g:ctrlp_map = '<leader>d' " Remap ctrl + p to ,d

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

" ctrlp.vim

" Clear last search highlighting
nnoremap <esc> :noh<return><esc>

" Space to toggle folds.
nnoremap <Space> za
vnoremap <Space> za

" Git fugitive remaps
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gc :Gcommit<cr>

" Rails remaps
nnoremap <leader>r :Rake<cr>

" Copy text to clipboard. Don't ask.
vmap <leader>c :!xclip -f -sel clip<CR>


" File Type specific settings
au FileType vim setlocal foldmethod=marker

au BufRead,BufNewFile *.md set filetype=markdown
