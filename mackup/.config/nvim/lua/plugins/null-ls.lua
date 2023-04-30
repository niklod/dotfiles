return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.goimports.with({ extra_args = { "-local", "code.moba.live" } }),
				nls.builtins.formatting.fixjson.with({ filetypes = { "json" } }),
				nls.builtins.formatting.yamlfmt.with({ filetypes = { "yaml", "yml" } }),
			},
		}
	end,
}
