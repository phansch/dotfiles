" be iMproved
set nocompatible
filetype off

" Plugins {{{
call plug#begin('~/.vim/plugged')

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'thoughtbot/vim-rspec'
Plug 'Keithbsmiley/rspec.vim'
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

" Theme settings
" Set terminal colors to 256
let g:gruvbox_termcolors=16
colorscheme gruvbox
set t_Co=256
set background=light

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
if executable("spring")
  let g:rspec_command = "!clear && spring rspec {spec} --color"
else
  let g:rspec_command = "!clear && rspec {spec} --color"
endif

" Incsearch, turn off highlighting of searches
let g:incsearch#auto_nohlsearch = 1

" Syntastic
let g:syntastic_ruby_checkers = ["mri"]
let g:syntastic_ruby_exec = "/home/phansch/.rvm/rubies/ruby-2.1.6/bin/ruby"
let g:syntastic_check_on_open = 1
let g:syntastic_enable_signs = 1


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

" Abbreviations {{{
iabbrev teh the
iabbrev seperate separate
iabbrev FactoryGril FactoryGirl
iabbrev loctation location
iabbrev sessinos sessions
iabbrev initator initiator
iabbrev conut count
" }}}

" Mappings {{{

nnoremap <leader>q :q<cr>
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

" Remap split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

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
nnoremap <esc> :nohlsearch<return><esc>

" Git fugitive remaps
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gco :Gcheckout<cr>
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gp :Gpush<cr>
nnoremap <leader>gl :Gpull<cr>

" Copy/pasting remaps
nnoremap <leader>y "+y
nnoremap <leader>p "+p

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <leader>av :AV<cr>

" go substitute because the default map for sleeping is silly
nnoremap gs :%s//g<Left><Left>

nnoremap <space>e :Explore<cr>
" Show 3 levels for :Explore
let g:netrw_liststyle=3

" let terminal resize scale the internal windows
autocmd VimResized * :wincmd =

" format json (requires jq to be installed)
noremap <leader>fj :call FormatJson()<CR>

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

" Convenience remaps
noremap <leader>nn :tabnew ~/documents/03si/Notes.md<cr>
noremap <leader>jj :tabnew ~/documents/03si/Journal.md<cr>

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Open vimrc
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

" Remove trailing whitespace for some filetypes
autocmd FileType ruby,js,css autocmd BufWritePre <buffer> :%s/\s\+$//e

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

function! FormatJson()
  :silent execute ":%!cat % | jq '.'"
endfunction

function! OpenCurrentFileInBrowser()
  " Open current markdown file in browser and pipes stdout to /dev/null
  :silent execute "!sensible-browser %"

  " Fix empty vim window by forcing a redraw
  :redraw!
endfu

" }}}
