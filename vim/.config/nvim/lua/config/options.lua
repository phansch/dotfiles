-- vim.g.lazyvim_picker = "fzf"
vim.g.lazyvim_ruby_lsp = "ruby_lsp"
vim.g.lazyvim_ruby_formatter = "standardrb"

vim.g.lazyvim_picker = "fzf"

local opt = vim.opt

opt.ruler = true
opt.relativenumber = false

-- Make sure that comments are automatically wrapped at 'textwidth'.
-- See :help fo-table for details on the options.
opt.textwidth = 78
opt.formatoptions = "jcroq"
