-- Based on this Reddit post:
-- https://www.reddit.com/r/neovim/comments/wl678s/comment/ik84pjx/
local function do_custom_hi()
	vim.api.nvim_set_hl(0, "Pry", { standout = true })
	vim.api.nvim_set_hl(0, "FocusTrue", { standout = true })
end

local custom_highlights = vim.api.nvim_create_augroup("custom_highlights", { clear = true })
vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = do_custom_hi,
	group = custom_highlights,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
	pattern = "*.rb",
	command = [[
      syn match Pry 'binding.pry'
      syn match FocusTrue 'focus: true'
    ]],
})
