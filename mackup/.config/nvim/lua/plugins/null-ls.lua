return {
	"nvimtools/none-ls.nvim",
	event = "BufReadPre",
	dependencies = { "mason.nvim" },
	opts = function()
		local nls = require("null-ls")
		return {
			sources = {
				nls.builtins.formatting.stylua,
				nls.builtins.formatting.fixjson.with({ filetypes = { "json" } }),
			},
		}
	end,
}
