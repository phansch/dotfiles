return {
	{ "dracula/vim", as = "dracula" },

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "dracula",
		},
	},

	"tpope/vim-commentary",
	"tpope/vim-endwise",
	"tpope/vim-repeat",

	{
		"stevearc/oil.nvim",
		config = function()
			require("oil").setup({
				keymaps = {
					["<C-h>"] = false,
					["<M-h>"] = "actions.select_split",
				},
				view_options = {
					show_hidden = true,
				},
			})
			vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
		end,
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup()
		end,
	},

	-- Git
	"rhysd/git-messenger.vim",

	-- Other
	"DataWraith/auto_mkdir",
	"terryma/vim-expand-region",
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},
	-- Show full path of files in lualine
	{
		"nvim-lualine/lualine.nvim",
		event = "VeryLazy",
		enabled = true,
		opts = function(_, opts)
			opts.sections.lualine_c[4] = { "filename", path = 1 }
		end,
	},
}
