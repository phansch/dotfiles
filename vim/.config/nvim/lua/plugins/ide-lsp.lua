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
	"honza/vim-snippets", -- Only the snippet database.
	"SirVer/ultisnips", -- The snippet "engine"
	"quangnguyen30192/cmp-nvim-ultisnips", -- snippet-completion plugin
}
