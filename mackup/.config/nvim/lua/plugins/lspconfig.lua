return {
	"neovim/nvim-lspconfig",
	---@class PluginLspOpts
	init = function()
		local keys = require("lazyvim.plugins.lsp.keymaps").get()
		local telescope = require("telescope.builtin")

		keys[#keys + 1] = { "gi", telescope.lsp_implementations }
	end,
	opts = {
		---@type lspconfig.options
		servers = {
			-- pyright will be automatically installed with mason and loaded with lspconfig
			pyright = {},
			gopls = {
				keys = {
					-- Workaround for the lack of a DAP strategy in neotest-go: https://github.com/nvim-neotest/neotest-go/issues/12
					{ "<leader>td", "<cmd>lua require('dap-go').debug_test()<CR>", desc = "Debug Nearest (Go)" },
				},
				settings = {
					gopls = {
						gofumpt = true,
						codelenses = {
							gc_details = false,
							generate = true,
							regenerate_cgo = true,
							run_govulncheck = true,
							test = true,
							tidy = true,
							upgrade_dependency = true,
							vendor = true,
						},
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
						analyses = {
							fieldalignment = true,
							nilness = true,
							unusedparams = true,
							unusedwrite = true,
							useany = true,
						},
						usePlaceholders = true,
						completeUnimported = true,
						staticcheck = true,
						directoryFilters = { "-.git", "-.vscode", "-.idea", "-.vscode-test", "-node_modules" },
						semanticTokens = true,
					},
				},
			},
			yamlls = {
				format = {
					enable = true,
					singleQuote = true,
				},
			},
			marksman = {
				filetypes = { "markdown", "md" },
			},
		},
	},
}
