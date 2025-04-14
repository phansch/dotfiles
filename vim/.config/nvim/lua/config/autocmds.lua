-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- local function augroup(name)
-- 	return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
-- end

-- vim.api.nvim_create_autocmd({ "FileType" }, {
-- 	group = augroup("filetype_markdown"),
-- 	pattern = { "md", "markdown" },
-- 	callback = function()
-- 		vim.opt_local.textwidth = 80
-- 		vim.opt_local.nofoldenable = true
-- 		vim.opt_local.wrap = true
-- 	end,
-- })

-- Disable autoformat for markdown files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "markdown" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Disable autoformat for ruby files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "ruby" },
	callback = function()
		vim.b.autoformat = false
	end,
})

-- Disable autoformat for yaml files
vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = { "yaml" },
	callback = function()
		vim.b.autoformat = false
	end,
})
