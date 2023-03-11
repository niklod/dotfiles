return -- change some telescope options and a keymap to browse plugin files
{
	{
		"telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"HUAHUAI23/telescope-dapzzzz",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
				require("telescope").load_extension("dap")
				require("telescope").load_extension("i23")
			end,
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		keys = {
			{ "<Leader><space>", "<leader>fF", desc = "Explorer NeoTree (cwd)", remap = true },
		},
		opts = {
			mappings = {
				i = {
					["<c-t>"] = function(...)
						return require("trouble.providers.telescope").open_with_trouble(...)
					end,
					["<c-d>"] = function(...)
						return require("telescope.actions").delete_buffer(...)
					end,
					["<a-i>"] = function()
						Util.telescope("find_files", { no_ignore = true })()
					end,
					["<a-h>"] = function()
						Util.telescope("find_files", { hidden = true })()
					end,
					["<C-Down>"] = function(...)
						return require("telescope.actions").cycle_history_next(...)
					end,
					["<C-Up>"] = function(...)
						return require("telescope.actions").cycle_history_prev(...)
					end,
				},
			},
			defaults = {
				mappings = {
					i = {
						["<c-d>"] = function(...)
							return require("telescope.actions").delete_buffer(...)
						end,
					},
					n = {
						["<c-d>"] = function(...)
							return require("telescope.actions").delete_buffer(...)
						end,
					},
				},
				file_ignore_patterns = { ".git/", "node_modules" },
				layout_strategy = "horizontal",
				layout_config = { prompt_position = "top" },
				sorting_strategy = "ascending",
				winblend = 0,
			},
		},
	},
}
