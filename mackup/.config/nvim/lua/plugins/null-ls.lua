return {
	"jose-elias-alvarez/null-ls.nvim",
	event = "BufReadPre",
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")
		return {
			root_dir = require("null-ls.utils").root_pattern(".null-ls-root", ".neoconf.json", "Makefile", ".git"),
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.goimports.with({ extra_args = { "-local", "code.moba.live" } }),
				nls.builtins.formatting.fixjson.with({ filetypes = { "json" } }),
				nls.builtins.formatting.pg_format.with({ filetypes = { "sql" } }),
			},
		}
	end,
}
