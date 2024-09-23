return {
	{ "dracula/vim", as = "dracula" },

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "dracula",
		},
	},

	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ltex = {},
			},
		},
	},

	-- Insert mode (Some insert mode stuff isn"t supported in NeoVim VSCode
	-- because it"s handed off to VSCode)
	"tpope/vim-commentary",
	"tpope/vim-endwise",
	"tpope/vim-repeat",
	"jiangmiao/auto-pairs",

	"honza/vim-snippets", -- Only the snippet database.
	"SirVer/ultisnips", -- The snippet "engine"
	"quangnguyen30192/cmp-nvim-ultisnips", -- snippet-completion plugin

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
}
