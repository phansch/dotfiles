set nocompatible
filetype off

" Plugins {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.local/share/nvim/plugged')

" Language specific
Plug 'elixir-lang/vim-elixir',                 { 'for': ['elixir'] }
Plug 'rodjek/vim-puppet'
Plug 'slashmili/alchemist.vim',                { 'for': ['elixir'] }
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'pangloss/vim-javascript',                { 'for': ['javascript', 'coffeescript'] }
Plug 'jelera/vim-javascript-syntax',           { 'for': ['javascript', 'coffeescript'] }
Plug 'othree/javascript-libraries-syntax.vim', { 'for': ['javascript', 'coffeescript'] }
Plug 'kchmck/vim-coffee-script'
Plug 'plasticboy/vim-markdown'

" Library dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Search and find
Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'tpope/vim-vinegar'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Insert mode
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Other
Plug 'DataWraith/auto_mkdir'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'

call plug#end()

filetype plugin indent on

" }}}


set re=1
" Settings {{{
set number
set hidden
set hlsearch
set showmode  " Display the mode you're in.
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

" Highlight search & replace
set inccommand=split

" Disable menu, and other gui elements
set guioptions=c

" This should make drawing the window 9000 times faster
set ttyfast
set lazyredraw
set regexpengine=2

" More frequent updates for, e.g. signs.
set updatetime=1200

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
colorscheme gruvbox
set background=dark
" Transparent background colors
let g:gitgutter_override_sign_column_highlight = 0
hi Normal ctermbg=NONE
hi SignColumn ctermbg=NONE
hi VertSplit ctermbg=NONE
hi StatusLine ctermbg=2 ctermfg=NONE
hi StatusLineNC ctermbg=2 ctermfg=0
hi GitGutterAdd ctermfg=2 ctermbg=NONE
hi GitGutterChange ctermfg=4 ctermbg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete ctermfg=1 ctermbg=NONE
hi User1 ctermfg=3

set fillchars=vert:\│,stlnc:\ ",stl:\ "
set laststatus=2
set statusline=%9*\ \ %L%*        " Total rownumber
set statusline+=%9*\ %f\           " File+path
set statusline+=%9*\on\ \[%1*%{GitInfo()}%*%9*\]  " Git Branch name

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return fugitive#head()
  else
    return ''
  endif
endfunction

" Leader
let mapleader = ","
let maplocalleader = "\\"

let g:gitgutter_sign_column_always = 1
" Make vim-gitgutter faster
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" Remap ctrl + p to ,d
let g:ctrlp_map = '<space>d'
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_prompt_mappings = {
  \ 'PrtClearCache()':      ['<c-r>'],
  \ }

let g:neomake_warning_sign = {
            \ 'text': '>>',
            \ 'texthl': 'WarningMsg',
            \ }

" }}}

" Ag settings
let g:ag_highlight=1

" nvim cursor shape
if has('nvim')
  let $NVIM_TUI_ENABLE_CURSOR_SHAPE=2
endif

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
iabbrev prereqs prerequisites
iabbrev pyr pry
iabbrev visibilty visibility
iabbrev enbaled enabled
iabbrev objecs objects
iabbrev shrug ¯\_(ツ)_/¯
" }}}

" Mappings {{{

nnoremap <leader>q :q<cr>
noremap <C-s> <esc>:w<CR>
inoremap <C-s> <esc>:w<CR>

" Remap split navigation
if has('nvim')
     nmap <BS> <C-W>h
endif
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
nnoremap <leader>gr :terminal git rebase -i origin/master<cr>

" Completion
let g:deoplete#enable_at_startup = 1

" Copy/pasting remaps
set clipboard+=unnamedplus

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

" Rails remaps
noremap <leader>fa :e spec/factories/<cr>
noremap <leader>sc :e db/schema.rb<cr>
noremap <leader>ro :e config/routes.rb<cr>

" Convenience remaps
noremap <leader>nn :tabnew ~/documents/03si/Notes.md<cr>
noremap <leader>jj :tabnew ~/documents/03si/Journal.md<cr>

" Open vimrc
nnoremap <leader>ev :tabnew ~/.dotfiles/config/nvim/init.vim<cr>

" Source vimrc
nnoremap <leader>sv :source ~/.dotfiles/config/nvim/init.vim<cr>

" }}}

" File Type specific settings {{{
augroup filetype_xdefaults
  au!
  au BufNewFile,BufRead *.xresources set filetype=xdefaults
augroup END

augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown

  au FileType markdown nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
  au FileType markdown nnoremap <leader>t :Toc<cr>
  au FileType markdown nnoremap <F5> :put ='### <' . strftime('%F %a') . '>'<cr>
  au FileType markdown inoremap <F5> :put ='### <' . strftime('%F %a') . '>'<cr>
  au FileType markdown let g:vim_markdown_new_list_item_indent = 2
  au FileType markdown let g:vim_markdown_toc_autofit = 1
augroup END

augroup filetype_html
  au!
  au FileType html nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
  au FileType eelixir SnipMateLoadScope html
augroup END

augroup filetype_coffee
  au!
  " use folding by indentation for coffeescript
  au FileType coffeescript setl foldmethod=indent nofoldenable
augroup END

" Turn syntax off for large files
autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif

" Remove trailing whitespace for some filetypes
autocmd FileType ruby,js,css autocmd BufWritePre <buffer> :%s/\s\+$//e

" Some custom ruby syntax highlights
augroup custom_ruby_syntax
  au!

  au FileType ruby :highlight FocusTrue ctermbg=1 ctermfg=2
  au FileType ruby :match FocusTrue 'focus: true'
  au FileType ruby syntax match Pry 'binding.pry'
  au FileType ruby highlight Pry ctermbg=1 ctermfg=2
augroup END

" }}}


" Custom functions {{{

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
