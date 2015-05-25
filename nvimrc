" Plugins {{{
call plug#begin('~/.nvim/plugged')

Plug 'vim-ruby/vim-ruby',                      { 'for': 'ruby' }
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake',                         { 'for': 'ruby' }
Plug 'thoughtbot/vim-rspec',                   { 'for': 'ruby' }
Plug 'pangloss/vim-javascript',                { 'for': 'javascript' }
Plug 'jelera/vim-javascript-syntax',           { 'for': 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': 'javascript' }
Plug 'ervandew/supertab'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-sensible'
Plug 'airblade/vim-gitgutter'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'scrooloose/syntastic',                   { 'for': ['ruby', 'javascript', 'css'] }
Plug 'rking/ag.vim'
Plug 'godlygeek/tabular'
Plug 'haya14busa/incsearch.vim'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on
tnoremap <esc> <C-\>

" Settings {{{
set number
set hidden
set hlsearch
set noshowmode  " Don't display the mode you're in.
set showmatch   " Show matching brackets/parenthesis
set list
set listchars=tab:▸\ ,trail:¬,extends:❯,precedes:❮
set showbreak=↪
set title " Set the terminal's title
set scrolloff=10
set relativenumber
set noesckeys "Make esc faster

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
set expandtab

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

set noswapfile
set nobackup
set nowritebackup

" Split settings
set splitbelow
set splitright

" Disable menu, and other gui elements
set guioptions=c

" This should make drawing the window 9000 times faster
set ttyfast
set lazyredraw
" Update syntax highlighting for more lines increased scrolling performance
syntax sync minlines=256
" Don't syntax highlight long lines
set synmaxcol=256

" Colorscheme
colorscheme gruvbox
set background=dark

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" Leader
let mapleader = ","
let maplocalleader = "\\"

nnoremap <leader>q :q<cr>
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
noremap j gj
noremap k gk

" hit <C-p>to toggle pastemode
set pastetoggle=<C-p>

" Clear last search highlighting
nnoremap <esc> :nohlsearch<return><esc>

" Remap ctrl + p to ,d
let g:ctrlp_map = '<space>d'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

nnoremap <space>b :CtrlPBuffer<cr>
nnoremap <space>m :CtrlPMRU<cr>

" Git fugitive remaps
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gl :Gpull<cr>

" Rails remaps
noremap <leader>bi :!bundle install<cr>
noremap <leader>fa :e spec/factories/<cr>
noremap <leader>sc :e db/schema.rb<cr>
noremap <leader>ro :e config/routes.rb<cr>

" Open vimrc
nnoremap <leader>ev :tabnew ~/.dotfiles/nvimrc<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" neovim
tnoremap <Esc> <C-\><C-n>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
