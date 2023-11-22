return {
	"nvim-neo-tree/neo-tree.nvim",
	enabled = false,
	cmd = "Neotree",
	keys = {
		{
			"<leader>fE",
			function()
				require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
			end,
			desc = "Explorer NeoTree (cwd)",
		},
		{ "<leader>e", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
	},
	dependencies = { "s1n7ax/nvim-window-picker" },
	deactivate = function()
		vim.cmd([[Neotree close]])
	end,
	init = function()
		vim.g.neo_tree_remove_legacy_commands = 1
		if vim.fn.argc() == 1 then
			local stat = vim.loop.fs_stat(vim.fn.argv(0))
			if stat and stat.type == "directory" then
				require("neo-tree")
			end
		end

		require("window-picker").setup({
			autoselect_one = true,
			include_current = false,
			filter_rules = {
				-- filter using buffer options
				bo = {
					-- if the file type is one of following, the window will be ignored
					filetype = { "neo-tree", "neo-tree-popup", "notify" },

					-- if the buffer type is one of following, the window will be ignored
					buftype = { "terminal", "quickfix" },
				},
			},
			other_win_hl_color = "#e35e4f",
		})
	end,
	opts = {
		filesystem = {
			filtered_items = {
				visible = true,
				hide_dotfiles = false,
				hide_gitignored = false,
				hide_by_name = {
					"node_modules",
					".git",
				},
				always_show = { -- remains visible even if other settings would normally hide it
					".gitignored",
					".env",
				},
			},
			close_if_last_window = true,
			bind_to_cwd = true,
			follow_current_file = true,
		},
		buffers = {
			follow_current_file = true, -- This will find and focus the file in the active buffer every
			-- time the current file is changed while the tree is open.
			group_empty_dirs = true, -- when true, empty folders will be grouped together
			show_unloaded = true,
		},
		window = {
			mappings = {
				["<space>"] = "none",
				["<2-LeftMouse>"] = "open",
				["o"] = "open",
				["<esc>"] = "revert_preview",
				["P"] = { "toggle_preview", config = { use_float = true } },
				["l"] = "focus_preview",
				-- ["S"] = "open_split",
				-- ["s"] = "open_vsplit",
				["S"] = "open_split",
				["s"] = "open_vsplit",
				["t"] = "open_tabnew",
				-- ["<cr>"] = "open_drop",
				-- ["t"] = "open_tab_drop",
				["w"] = "open_with_window_picker",
				--["P"] = "toggle_preview", -- enter preview mode, which shows the current node without focusing
				["<bs>"] = "close_node",
				["z"] = "close_all_nodes",
				--["Z"] = "expand_all_nodes",
				["a"] = {
					"add",
					-- this command supports BASH style brace expansion ("x{a,b,c}" -> xa,xb,xc). see `:h neo-tree-file-actions` for details
					-- some commands may take optional config options, see `:h neo-tree-mappings` for details
					config = {
						show_path = "none", -- "none", "relative", "absolute"
					},
				},
				["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
				["d"] = "delete",
				["r"] = "rename",
				["y"] = "copy_to_clipboard",
				["x"] = "cut_to_clipboard",
				["p"] = "paste_from_clipboard",
				["c"] = "copy", -- takes text input for destination, also accepts the optional config.show_path option like "add":
				-- ["c"] = {
				--  "copy",
				--  config = {
				--    show_path = "none" -- "none", "relative", "absolute"
				--  }
				--}
				["m"] = "move", -- takes text input for destination, also accepts the optional config.show_path option like "add".
				["q"] = "close_window",
				["R"] = "refresh",
				["?"] = "show_help",
				["<"] = "prev_source",
				[">"] = "next_source",
				["/"] = "noop",
			},
		},
	},
}
