return {
	{
		"williamboman/mason.nvim",
		opts = {
			-- package names can be found here: https://github.com/williamboman/mason-lspconfig.nvim/blob/main/doc/server-mapping.md
			ensure_installed = {
				"shellcheck",
				"shfmt",
				"ansible-lint",
				"codelldb",
				"erb-formatter",
				"erb-lint",
				"json-lsp",
				"ltex-ls",
				"lua-language-server",
				"markdown-toc",
				"markdownlint-cli2",
				"marksman",
				"pyright",
				"rubocop",
				"ruff",
				"shfmt",
				"stylua",
				"taplo",
				"texlab",
				"vtsls",
				"yaml-language-server",
			},
		},
	},
}
