-- vim.keymap.set('n', '<F5>', function() require('dap').continue() end)
--    vim.keymap.set('n', '<F10>', function() require('dap').step_over() end)
--    vim.keymap.set('n', '<F11>', function() require('dap').step_into() end)
--    vim.keymap.set('n', '<F12>', function() require('dap').step_out() end)
--    vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
--    vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
--    vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
--    vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
--    vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
return {
	"mfussenegger/nvim-dap",
	keys = {
		{
			",dr",
			function()
				require("dap").continue()
			end,
			remap = true,
		},
		{
			",dl",
			function()
				require("dap").run_last()
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

		dap.adapters.go = {
			type = "server",
			port = 38697,
			executable = {
				command = "dlv",
				args = { "dap", "-l", "127.0.0.1:38697" },
			},
		}
	end,
}
