return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()

		keys[#keys + 1] = { "gi", vim.lsp.buf.implementation }
	end,
	opts = {
		---@type lspconfig.options
		servers = {
			-- pyright will be automatically installed with mason and loaded with lspconfig
			pyright = {},
			gopls = {},
			yamlls = {
				format = {
					enable = true,
					singleQuote = true,
				},
			},
			golangci_lint_ls = {
				filetype = { "go", "gomod" },
			},
		},
	},
}
