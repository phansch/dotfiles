set nocompatible              " be iMproved
filetype off                  " required!


" Plugins {{{

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
Plugin 'gmarik/vundle'
Plugin 'vim-ruby/vim-ruby'
Plugin 'pangloss/vim-javascript'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'ervandew/supertab'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-rake'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-sensible'
Plugin 'thoughtbot/vim-rspec'
Plugin 'airblade/vim-gitgutter'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'gcmt/taboo.vim'
Plugin 'dbakker/vim-projectroot'
Plugin 'scrooloose/syntastic'

call vundle#end()
filetype plugin indent on

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" }}}


" Settings {{{

set nu
set hidden
set hlsearch
set cursorline
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

" Theme settings
set t_Co=256 " Set terminal colors to 256
set background=dark
colorscheme solarized "Set colorscheme to solarized

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

set noswapfile
set nobackup
set nowb

" Split settings
set splitbelow
set splitright

" Reload file if changed outside vim
set autoread
set guioptions=c " Disable menu, and other gui elements

" This should make drawing the window 9000 times faster
set ttyfast
set lazyredraw

" Leader
let mapleader = ","
let maplocalleader = "\\"

" Remap ctrl + p to ,d
let g:ctrlp_map = '<space>d'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

" vim-rspec should use spring and colored output
let g:rspec_command = "!clear && spring rspec {spec} --color"

"Taboo Tab settings
set showtabline=2 "always show tabs
let g:taboo_tab_format = ' %N: ['.fnamemodify(projectroot#guess(), ':t').']%m '
let g:taboo_renamed_tab_format = ' %N: [%l]%m'

let g:syntastic_ruby_exec = '/home/phansch/.rvm/rubies/ruby-2.1.4/bin/ruby'

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

" Stop that window from popping up
map q: :q

imap <leader>i <esc>
nnoremap <leader>q :q<cr>
map <C-s> <esc>:w<CR>
imap <C-s> <esc>:w<CR>
map <leader>s :use ctrl s instead!

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Mimic firefox tab behavior
map <C-t> <esc>:tabnew<cr>

nnoremap <space>b :CtrlPBuffer<cr>
nnoremap <space>m :CtrlPMRU<cr>
"nnoremap <space>f :
"nnoremap <space>y = :Unite -buffer-name=yankhist history/yank<cr>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_

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
nnoremap <leader>gp :Gpush<cr>

" Copy/pasting remaps
nnoremap <leader>y "+y
nnoremap <leader>p "+p

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <leader>av :AV<cr>


" Goyo remaps
nnoremap <leader><Space> :Goyo<CR>

" vim-rspec remaps
map <leader>t :call RunCurrentSpecFile()<CR>
map <leader>n :call RunNearestSpec()<CR>
map <leader>l :call RunLastSpec()<CR>
map <leader>a :call RunAllSpecs()<CR>

" Rails remaps
map <leader>bi :!bundle install<cr>
map <leader>fa :e spec/factories/<cr>
map <leader>sc :e db/schema.rb<cr>
map <leader>ro :e config/routes.rb<cr>

"Convenience remaps
map <leader>nn :tabnew ~/documents/03si/Notes.md<cr>
map <leader>jj :tabnew ~/documents/03si/Journal.md<cr>

"MEG remaps
map <leader>cc :TabooOpen cms<cr>:lcd ~/repos/cms/<cr>
map <leader>mm :TabooOpen tesla-mobile<cr>:lcd ~/repos/tesla-mobile/<cr>
map <leader>tt :TabooOpen tesla<cr>:lcd ~/repos/tesla/<cr>
map <leader>aa :TabooOpen admin<cr>:lcd ~/repos/admin/<cr>

" Open vimrc in split
nnoremap <leader>ev :TabooOpen vimrc<cr>:lcd ~/.dotfiles<cr>:e $MYVIMRC<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}


" File Type specific settings {{{
augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown

  au FileType markdown nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
augroup END

augroup filetype_vim
  au!
  " Have everything folded when opening vim files
  au FileType vim setl foldmethod=marker
augroup END

augroup filetype_html
  au FileType html nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
augroup END

augroup filetype_coffee
  au!
  au BufNewFile,BufRead *.coffee set filetype=coffeescript

  " use folding by indentation for coffeescript
  au FileType coffeescript setl foldmethod=indent nofoldenable
augroup END

" }}}


" Custom functions {{{

function! OpenCurrentFileInBrowser()
  " Open current markdown file in browser and pipes stdout to /dev/null
  :silent execute "!sensible-browser %"

  " Fix empty vim window by forcing a redraw
  :redraw!
endfu

" }}}
