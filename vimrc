set nocompatible              " be iMproved
filetype off                  " required!

" Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'ervandew/supertab'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-bundler'
Plugin 'tpope/vim-surround'
Plugin 'thoughtbot/vim-rspec'
Plugin 'airblade/vim-gitgutter'
Plugin 'tomtom/tcomment_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'kchmck/vim-coffee-script'

call vundle#end()

" powerline setup
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

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
set relativenumber
set noesckeys "Make esc faster
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

" Ruby/Rails stuff {{{
let g:rubycomplete_rails = 1
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
nnoremap <leader>q :q<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <leader>s :use ctrl s instead!

"Mimic firefox tab behavior
map <C-t> <esc>:tabnew<cr>

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

" Copy/pasting remaps
nnoremap <leader>y "+y
nnoremap <leader>p "+p

" vim-rspec remaps
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>n :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Rails remaps
map <leader>bi :!bundle install<cr>
map <leader>fa :e spec/factories/<cr>
map <leader>sc :e db/schema.rb<cr>
map <leader>ro :e config/routes.rb<cr>

" File Type specific settings
au FileType vim setlocal foldmethod=marker

au BufRead,BufNewFile *.md set filetype=markdown
