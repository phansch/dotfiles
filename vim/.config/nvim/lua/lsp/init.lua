local completion = require('completion')

local on_attach = function(client, bufnr)
  completion.on_attach(client, bufnr)
end

require'nvim_lsp'.solargraph.setup{
  on_attach = on_attach,
}
require'nvim_lsp'.rust_analyzer.setup{
  on_attach = on_attach,
}

