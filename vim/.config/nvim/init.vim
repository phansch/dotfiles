scriptencoding utf-8
filetype off

" Plugins {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')

" Language specific
Plug 'pearofducks/ansible-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'rlue/vim-fold-rspec'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'pangloss/vim-javascript',                { 'for': ['javascript', 'coffeescript'] }
Plug 'jelera/vim-javascript-syntax',           { 'for': ['javascript', 'coffeescript'] }
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'kchmck/vim-coffee-script'
" Plug 'junegunn/goyo.vim'

" Library dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Search and find
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-vinegar'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'rhysd/git-messenger.vim'

" Insert mode
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'

" Completion/IDE features
" NOTE: My understanding is, that this will be built-in to neovim at some
" point. So maybe check if this is still needed later.
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'honza/vim-snippets' " Only the snippet database.
Plug 'SirVer/ultisnips'

" Other
Plug 'christoomey/vim-tmux-navigator'
Plug 'DataWraith/auto_mkdir'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'terryma/vim-expand-region'

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
" Make vim-gitgutter faster
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" }}}

" Completion/IDE/LSP settings {{{
" How I want this to work:
"
" <TAB> should trigger completion
" <TAB> should expand snippets from completion
" <TAB> should advance to the next selection
"
" gd should jump to definition
" rn should attempt a rename
" K should show documentation (doHover)

" Avoid showing message extra message when using completion
set shortmess+=c
lua require("lsp")

nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()<CR>

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Better Completion
set complete=.,w,b,u,t
set completeopt=menuone,noinsert,noselect

" Snippet config for `completion-nvim`
let g:completion_enable_snippet = 'UltiSnips'
" }}}

" fzf settings
let g:fzf_tags_command = 'ctags -R'

" vimwiki settings
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
      \{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = ''

" Rust
let g:rustfmt_autosave = 0
let g:rustfmt_command = 'rustfmt +stable'
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
iabbrev prereqs prerequisites
iabbrev pyr pry
iabbrev visibilty visibility
iabbrev enbaled enabled
iabbrev objecs objects
iabbrev shrug ¯\_(ツ)_/¯
iabbrev mothed method
iabbrev erros errors
iabbrev haproxy HAproxy
iabbrev commen common
iabbrev mysql MySQL
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

" Copy/pasting remaps
set clipboard+=unnamedplus

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <leader>av :AV<cr>

" go substitute because the default map for sleeping is silly
nnoremap gs :%s//g<Left><Left>

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

  " Unfold everything first, I can fold my code myself
  au BufRead * normal zR
augroup END

augroup filetype_markdown
  au!
  au BufNewFile,BufRead *.md set filetype=markdown

  au FileType markdown set nofoldenable
  au FileType markdown nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
  au FileType markdown nnoremap <leader>t :Toc<cr>
  au FileType markdown nnoremap <F5> :put ='### <' . strftime('%F %a') . '>'<cr>
  au FileType markdown inoremap <F5> :put ='### <' . strftime('%F %a') . '>'<cr>
  au FileType markdown let g:vim_markdown_new_list_item_indent = 2
  au FileType markdown let g:vim_markdown_toc_autofit = 1
  au FileType markdown setlocal textwidth=80
  au FileType markdown set wrap
augroup END

augroup filetype_html
  au!
  au FileType html nnoremap <leader>f :call OpenCurrentFileInBrowser()<cr>
augroup END

augroup no_syntax_highlight_for_big_files
  au!
  autocmd BufReadPre * if getfsize(expand("%")) > 10000000 | syntax off | endif
augroup END

augroup remove_trailing_whitespace
  au!
  autocmd FileType ruby,rust,js,css autocmd BufWritePre <buffer> :%s/\s\+$//e
augroup END

" Some custom ruby syntax highlights
augroup custom_ruby_syntax
  au!

  au BufNewFile,BufRead *.prawn set filetype=ruby
  au FileType ruby :highlight FocusTrue ctermbg=1 ctermfg=2
  au FileType ruby :match FocusTrue 'focus: true'
  au FileType ruby syntax match Pry 'binding.pry'
  au FileType ruby syntax match Irb 'binding.irb'
  au FileType ruby highlight Pry ctermbg=1 ctermfg=2
  au FileType ruby highlight Irb ctermbg=1 ctermfg=2
augroup END

augroup git_commit_spelling
  au!

  au BufNewFile,BufRead COMMIT_EDITMSG set spell
augroup END

augroup wiki_diary_skeleton
  au!

  autocmd BufNewFile diary/*.md call LoadSkeleton('diary')
augroup END

augroup ruby_skeleton
  au!

  autocmd BufNewFile *.rb call LoadSkeleton('ruby')
augroup END

augroup rust
  au!

  au FileType rust set shiftwidth=4
  au FileType rust set softtabstop=4
augroup END
" }}}

" Fix netrw/vinegar file explorer issue: https://github.com/tpope/vim-vinegar/issues/13
" This is not perfect, because it will still display the error messages for a
" short duration when closing vim. Maybe it makes more sense to look for a
" file explorer alternative at some point.
let g:netrw_fastbrowse = 0

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

" Highlight non-ascii characters in red
syntax match nonascii "[^\x00-\x7F]"
highlight nonascii guibg=Red ctermbg=2
