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
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'pangloss/vim-javascript',                { 'for': ['javascript', 'coffeescript'] }
Plug 'jelera/vim-javascript-syntax',           { 'for': ['javascript', 'coffeescript'] }
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'

" Library dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Search and find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-vinegar'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Insert mode
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Other
Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
Plug 'christoomey/vim-tmux-navigator'
Plug 'DataWraith/auto_mkdir'
Plug 'w0rp/ale'
Plug 'morhetz/gruvbox'

call plug#end()

filetype plugin indent on

" }}}


" Settings {{{
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
set expandtab

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone,preview

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

command! Gamend :Gcommit --amend

" Leader
let mapleader = ","
let maplocalleader = "\\"

set signcolumn=yes
" Make vim-gitgutter faster
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" }}}

" LanguageClient settings {{{
let g:LanguageClient_serverCommands = {
    \ 'ruby': ['/home/phansch/.rvm/gems/ruby-2.4.1/bin/language_server-ruby'],
    \ 'javascript': ['/opt/javascript-typescript-langserver/lib/language-server-stdio.js'],
    \ }

" Automatically start language servers.
let g:LanguageClient_autoStart = 1

nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
" }}}

" fzf settings
let g:fzf_tags_command = 'ctags -R'

let g:vimwiki_list = [
      \{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
      \{'path': '~/code/documentation.wiki/', 'syntax': 'markdown', 'ext': '.md'}]

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
iabbrev mothed method
iabbrev erros errors
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

nnoremap <A-j> }
nnoremap <A-k> {
vnoremap <A-j> }
vnoremap <A-k> {
nnoremap <space>d :FZF<cr>
nnoremap <space>b :Buffers<cr>
nnoremap <space>m :History<cr>

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
augroup vim_resize
  au!
  autocmd VimResized * :wincmd =
augroup END

" format json (requires jq to be installed)
noremap <leader>fj :call FormatJson()<CR>

" Open vimrc
nnoremap <leader>ev :tabnew ~/.dotfiles/vim/.config/nvim/init.vim<cr>

" Source vimrc
nnoremap <leader>sv :source ~/.dotfiles/vim/.config/nvim/init.vim<cr>

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

augroup no_syntax_highlight_for_big_files
  au!
  autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
augroup END

augroup remove_trailing_whitespace
  au!
  autocmd FileType ruby,js,css autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" Some custom ruby syntax highlights
augroup custom_ruby_syntax
  au!

  au FileType ruby :highlight FocusTrue ctermbg=1 ctermfg=2
  au FileType ruby :match FocusTrue 'focus: true'
  au FileType ruby syntax match Pry 'binding.pry'
  au FileType ruby highlight Pry ctermbg=1 ctermfg=2
augroup END

augroup ruby_skeleton
  au!

  autocmd BufNewFile *.rb call LoadSkeleton('ruby')
augroup END

" }}}


" Custom functions {{{

function! FormatJson()
  :silent execute ":%!cat % | jq '.'"
endfunction

function! OpenCurrentFileInBrowser()
  " Open current markdown file in browser and pipes stdout to /dev/null
  :silent execute '!sensible-browser %'

  " Fix empty vim window by forcing a redraw
  :redraw!
endfu

function! LoadSkeleton(type)
  " Load the given skeleton type and go two lines down
  let l:file = '~/.config/nvim/skeleton.' . a:type
  :silent execute '0read ' . l:file
  :silent execute 'normal! jj'
endfunction
" }}}
