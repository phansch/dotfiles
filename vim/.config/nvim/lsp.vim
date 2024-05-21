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

" lua require("lsp")

" nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
" nnoremap <silent> K  <cmd>lua vim.lsp.buf.hover()<CR>

" " Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Better Completion
set complete=.,w,b,u,t
set completeopt=menuone,noinsert,noselect

" Snippet config for `completion-nvim`
let g:completion_enable_snippet = 'UltiSnips'

" Avoid showing message extra message when using completion
set shortmess+=c
