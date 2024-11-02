-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set

map("n", "<S-h>", "^", { desc = "Start of line" })
map("n", "<S-l>", "$", { desc = "End of line" })
map("v", "<S-l>", "g_", { desc = "End of line" })

vim.keymap.set("n", "<leader>tf", ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", { desc = "RSpec on file" })
vim.keymap.set("n", "<leader>tl", ":lua require('neotest').run.run()<CR>", { desc = "RSpec on test" })
vim.keymap.set("n", "<leader>to", ":lua require('neotest').output.open({enter = true})<CR>", { desc = "RSpec output" })
vim.keymap.set("n", "<leader>tp", ":lua require('neotest').summary.open()<CR>", { desc = "RSpec summary" })
