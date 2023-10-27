return {
	"stevearc/conform.nvim",
	optional = true,
	opts = {
		formatters = {
			goimports = {
				command = "goimports",
				args = { "-local", "code.moba.live" },
			},
		},
		formatters_by_ft = {
			sql = { "pg_format" },
			go = { "goimports" },
		},
	},
}
