local function all_trim(s)
	return s:match("^%s*(.-)%s*$")
end

return {
	{
		"mfussenegger/nvim-dap",
		opts = {
			console = "integrateTerminal",
		},
		keys = {
			{
				",dr",
				function()
					require("dap").continue({ terminateDebugee = false })
				end,
				remap = true,
			},
			{
				",dl",
				function()
					require("dap").run_last({ terminateDebugee = false })
				end,
				remap = true,
			},
			{
				",b",
				function()
					require("dap").toggle_breakpoint()
				end,
				remap = true,
			},
			{
				",ds",
				function()
					require("dap").disconnect({ terminateDebuggee = true })
				end,
				remap = true,
			},
		},
		config = function()
			local dap = require("dap")
			require("dap.ext.vscode").load_launchjs()

			-- Placeholder expansion for launch directives
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
			for type, _ in pairs(dap.configurations) do
				for _, config in pairs(dap.configurations[type]) do
					if config.envFile then
						local filePath = config.envFile
						for key, fn in pairs(placeholders) do
							filePath = filePath:gsub(key, fn)
						end

						-- Verify file exists
						local f = io.open(filePath, "r")
						if f ~= nil then
							for line in io.lines(filePath) do
								local words = {}
								for word in string.gmatch(line, "[^=]+") do
									table.insert(words, all_trim(word))
								end
								if not config.env then
									config.env = {}
								end
								config.env[words[1]] = words[2]
							end
						end
					end
				end
			end

			dap.adapters.go = {
				type = "server",
				port = 38697,
				executable = {
					command = "dlv",
					args = { "dap", "-l", "127.0.0.1:38697" },
				},
			}
		end,
	},
	{
		"mxsdev/nvim-dap-vscode-js",
	},
}
