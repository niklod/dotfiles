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
			},
		}
	end,
}
