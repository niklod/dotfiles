return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	opts = {
		---@type lspconfig.options
		servers = {
			-- pyright will be automatically installed with mason and loaded with lspconfig
			pyright = {},
			gopls = {},
			golangci_lint_ls = {
				filetype = { "go", "gomod" },
			},
		},
		-- setup = {
		-- 	golangcilsp = function(_, opts)
		-- 		root_dir = require("lspconfig").util.root_pattern("go.mod", ".golangci.yaml", ".git")
		-- 	end,
		-- },
	},
}
