return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ltex = {},
				ruby_lsp = {
					mason = false,
					cmd = { vim.fn.expand("~/.asdf/shims/ruby-lsp") },
				},
			},
		},
	},

	-- Ruby on Rails
	"tpope/vim-rails",
	{
		"nvim-neotest/neotest",
		dependencies = {
			"olimorris/neotest-rspec",
			"zidhuss/neotest-minitest",
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-rspec"),
					require("neotest-minitest"),
				},
			})
		end,
	},
}
