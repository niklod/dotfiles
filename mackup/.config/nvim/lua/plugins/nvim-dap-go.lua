local function all_trim(s)
	return s:match("^%s*(.-)%s*$")
end
return {
	"leoluz/nvim-dap-go",
	keys = {
		{
			",dt",
			function()
				require("dap-go").debug_test()
			end,
			remap = true,
		},
		{
			",dT",
			function()
				require("dap-go").debug_last_test()
			end,
			remap = true,
		},
	},
	config = function()
		local placeholders = {
			["${file}"] = function(_)
				return vim.fn.expand("%:p")
			end,
			["${fileBasename}"] = function(_)
				return vim.fn.expand("%:t")
			end,
			["${fileBasenameNoExtension}"] = function(_)
				return vim.fn.fnamemodify(vim.fn.expand("%:t"), ":r")
			end,
			["${fileDirname}"] = function(_)
				return vim.fn.expand("%:p:h")
			end,
			["${fileExtname}"] = function(_)
				return vim.fn.expand("%:e")
			end,
			["${relativeFile}"] = function(_)
				return vim.fn.expand("%:.")
			end,
			["${relativeFileDirname}"] = function(_)
				return vim.fn.fnamemodify(vim.fn.expand("%:.:h"), ":r")
			end,
			["${workspaceFolder}"] = function(_)
				return vim.fn.getcwd()
			end,
			["${workspaceFolderBasename}"] = function(_)
				return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			end,
			["${env:([%w_]+)}"] = function(match)
				return os.getenv(match) or ""
			end,
		}

		require("dap-go").setup({
			dap_configurations = {},
			delve = {
				-- the path to the executable dlv which will be used for debugging.
				-- by default, this is the "dlv" executable on your PATH.
				path = "dlv",
				-- time to wait for delve to initialize the debug session.
				-- default to 20 seconds
				initialize_timeout_sec = 20,
				-- a string that defines the port to start delve debugger.
				-- default to string "${port}" which instructs nvim-dap
				-- to start the process in a random available port
				port = "${port}",
				-- additional args to pass to dlv
				args = {},
				-- the build flags that are passed to delve.
				-- defaults to empty string, but can be used to provide flags
				-- such as "-tags=unit" to make sure the test suite is
				-- compiled during debugging, for example.
				-- passing build flags using args is ineffective, as those are
				-- ignored by delve in dap mode.
				build_flags = "",
			},
		})
	end,
}
