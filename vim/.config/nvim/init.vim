scriptencoding utf-8

" Plugins {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup plug
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup END
endif

call plug#begin('~/.local/share/nvim/plugged')

" # Plugins that work in both VSCode and NeoVim:
Plug 'tpope/vim-vinegar'

" Library dependencies
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'

" Language specific
" TODO: These may not work in VSCode completely
Plug 'pearofducks/ansible-vim'
Plug 'vim-ruby/vim-ruby'
Plug 'rlue/vim-fold-rspec'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rake'
Plug 'pangloss/vim-javascript',                { 'for': ['javascript', 'coffeescript'] }
Plug 'jelera/vim-javascript-syntax',           { 'for': ['javascript', 'coffeescript'] }
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'
Plug 'posva/vim-vue'
Plug 'kchmck/vim-coffee-script'
Plug 'dart-lang/dart-vim-plugin'
" Plug 'junegunn/goyo.vim'

if exists('g:vscode')
  " # Plugins that only work in VSCode
else
  " # Plugins that only work in NeoVim

  " Search and find
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Insert mode (NeoVim VSCode does not support insert mode stuff
  " because it's handed off to VSCode)
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'jiangmiao/auto-pairs'

  " Completion/IDE features
  " NOTE: My understanding is, that this will be built-in to neovim at some
  " point. So maybe check if this is still needed later.
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'honza/vim-snippets' " Only the snippet database.
  Plug 'SirVer/ultisnips'

  " Git
  Plug 'airblade/vim-gitgutter'
  Plug 'rhysd/git-messenger.vim'

  " Other
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'DataWraith/auto_mkdir'
  Plug 'dracula/vim', { 'as': 'dracula' }
  Plug 'terryma/vim-expand-region'
endif

call plug#end()

filetype plugin indent on

" }}}

source $HOME/.config/nvim/general_settings.vim

if exists('g:vscode')
  xmap gc  <Plug>VSCodeCommentary
  nmap gc  <Plug>VSCodeCommentary
  omap gc  <Plug>VSCodeCommentary
  nmap gcc <Plug>VSCodeCommentaryLine
else
  source $HOME/.config/nvim/lsp.vim
  source $HOME/.config/nvim/abbreviations.vim

  " Make vim-gitgutter faster
  let g:gitgutter_realtime = 0
  let g:gitgutter_eager = 0

endif

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

" Mappings {{{

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
nnoremap <space>d :Files<cr>
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

" Clear last search highlighting when pressing ESC
nnoremap <esc> :nohlsearch<return><esc>

" Copy/pasting remaps
set clipboard+=unnamedplus

vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

nnoremap <leader>av :AV<cr>

" go substitute because the default map for sleeping is silly
nnoremap gs :%s//g<Left><Left>

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
  au FileType ruby syntax match FocusTrue 'focus: true'
  au FileType ruby syntax match Pry 'binding.pry'
  au FileType ruby syntax match Irb 'binding.irb'
  au FileType ruby highlight Pry ctermbg=1 ctermfg=2
  au FileType ruby highlight Irb ctermbg=1 ctermfg=2
  au FileType ruby highlight FocusTrue ctermbg=1 ctermfg=2
augroup END

augroup git_commit_spelling
  au!

  au BufNewFile,BufRead COMMIT_EDITMSG set spell
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

" Show 3 levels for :Explore
let g:netrw_liststyle=3

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
