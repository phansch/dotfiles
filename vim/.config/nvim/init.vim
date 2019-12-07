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
Plug 'rodjek/vim-puppet'
Plug 'vim-ruby/vim-ruby'
Plug 'rlue/vim-fold-rspec'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'pangloss/vim-javascript',                { 'for': ['javascript', 'coffeescript'] }
Plug 'mxw/vim-jsx',                            { 'for': ['javascript'] }
Plug 'jelera/vim-javascript-syntax',           { 'for': ['javascript', 'coffeescript'] }
Plug 'plasticboy/vim-markdown'
Plug 'vimwiki/vimwiki'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
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
Plug 'honza/vim-snippets'

" Completion features
Plug 'neovim/nvim-lsp'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'

" Other
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

" Make sure that comments are automatically wrapped at 'textwidth'.
" See :help fo-table for details on the options.
set textwidth=78
set formatoptions=jcroq

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

" nvim cursor shape
if has('nvim')
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175
endif

" Theme settings
colorscheme gruvbox
set background=dark
" Transparent background colors
let g:gitgutter_override_sign_column_highlight = 0
hi Normal ctermbg=NONE
hi SignColumn ctermbg=NONE
hi VertSplit ctermbg=NONE
hi StatusLine ctermfg=8 ctermbg=0
hi StatusLineNC ctermfg=8 ctermbg=0
hi GitGutterAdd ctermfg=2 ctermbg=NONE
hi GitGutterChange ctermfg=4 ctermbg=NONE
hi GitGutterDelete ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete ctermfg=1 ctermbg=NONE
hi User1 ctermfg=3

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

" Completion settings {{{
set shortmess+=c
let g:UltiSnipsExpandTrigger='<nop>'

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" }}}

" Disable ALE for rust-clippy
let g:ale_pattern_options = { 'rust-clippy': { 'ale_enabled': 0 } }

" LanguageClient settings {{{
call nvim_lsp#setup('rust_analyzer', {})
" }}}

" fzf settings
let g:fzf_tags_command = 'ctags -R'

" vimwiki settings
let g:vimwiki_global_ext = 0
let g:vimwiki_list = [
      \{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'},
      \{'path': '~/code/documentation.wiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_folding = ''

" Rust
let g:rustfmt_autosave = 0
let g:rustfmt_command = 'rustfmt +stable'

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

augroup filetype_javascript
  au!
  au FileType javascript let g:jsx_ext_required = 0
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
  au FileType ruby highlight Pry ctermbg=1 ctermfg=2
  au FileType ruby setlocal omnifunc=LanguageClient#complete
  hi def link rubyCapitalizedMethod rubyConstant
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

  au FileType rust nnoremap <silent> K :call LanguageClient_textDocument_hover()<cr>
  au FileType rust nnoremap <silent> gd :call LanguageClient_textDocument_definition()<cr>
  au FileType rust nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<cr>
  au FileType rust set shiftwidth=4
  au FileType rust set softtabstop=4
augroup END
" }}}

" Fix netrw/vinegar file explorer issue: https://github.com/tpope/vim-vinegar/issues/13
" This is not perfect, because it will still display the error messages for a
" short duration when closing vim. Maybe it makes more sense to look for a
" file explorer alternative at some point.
function! QuitNetrw()
  for i in range(1, bufnr($))
    if buflisted(i)
      if getbufvar(i, '&filetype') ==# 'netrw'
        silent exe 'bwipeout ' . i
      endif
    endif
  endfor
endfunction

augroup vim
  au! VimLeavePre *  call QuitNetrw()
augroup END

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
