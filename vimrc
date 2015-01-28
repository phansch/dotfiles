" be iMproved
set nocompatible
filetype off

" Plugins {{{
call plug#begin('~/.vim/plugged')

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

call plug#end()

filetype plugin indent on

python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

" }}}


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

" Theme settings
" Set terminal colors to 256
set t_Co=256
set background=dark
colorscheme solarized "Set colorscheme to solarized

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

set noswapfile
set nobackup
set nowritebackup

" Split settings
set splitbelow
set splitright

" Reload file if changed outside vim
set autoread
" Disable menu, and other gui elements
set guioptions=c

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

" Incsearch, turn off highlighting of searches
let g:incsearch#auto_nohlsearch = 1

" Syntastic
let g:syntastic_ruby_exec = '/home/phansch/.rvm/rubies/ruby-2.1.4/bin/ruby'
let g:syntastic_check_on_open = 1


let g:rubycomplete_rails = 1

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

iabbrev pry binding.pry

" Mappings {{{

" Disable help key.
noremap  <F1> <nop>
inoremap <F1> <nop>

" Stop that window from popping up
noremap q: :q

nnoremap <leader>q :q<cr>
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"Mimic firefox tab behavior
noremap <C-t> <esc>:tabnew<cr>

nnoremap <space>b :CtrlPBuffer<cr>
nnoremap <space>m :CtrlPMRU<cr>

" Easier to type, and I never use the default behavior.
noremap H ^
noremap L $
vnoremap L g_
noremap j gj
noremap k gk


" hit <C-p>to toggle pastemode
set pastetoggle=<C-p>

" Clear last search highlighting
nnoremap <esc> :noh<return><esc>

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


" vim-rspec remaps
noremap <leader>t :call RunCurrentSpecFile()<CR>
noremap <leader>n :call RunNearestSpec()<CR>
noremap <leader>l :call RunLastSpec()<CR>
noremap <leader>a :call RunAllSpecs()<CR>

" Rails remaps
noremap <leader>bi :!bundle install<cr>
noremap <leader>fa :e spec/factories/<cr>
noremap <leader>sc :e db/schema.rb<cr>
noremap <leader>ro :e config/routes.rb<cr>

" Incsearch mappings
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)

"Convenience remaps
noremap <leader>nn :tabnew ~/documents/03si/Notes.md<cr>
noremap <leader>jj :tabnew ~/documents/03si/Journal.md<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Open vimrc in split
nnoremap <leader>ev :tabnew ~/.dotfiles/vimrc<cr>

" Source vimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

" }}}


" File Type specific settings {{{
augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown

  au FileType markdown nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
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

" Turn syntax off for large files
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" }}}


" Custom functions {{{

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

function! OpenCurrentFileInBrowser()
  " Open current markdown file in browser and pipes stdout to /dev/null
  :silent execute "!sensible-browser %"

  " Fix empty vim window by forcing a redraw
  :redraw!
endfu

" }}}
