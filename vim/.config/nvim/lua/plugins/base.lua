return {
	{ "dracula/vim", as = "dracula" },

	{
		"LazyVim/LazyVim",
		opts = {
			colorscheme = "dracula",
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
	"christoomey/vim-tmux-navigator",
	"DataWraith/auto_mkdir",
	"terryma/vim-expand-region",
}
