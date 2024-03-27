return -- change some telescope options and a keymap to browse plugin files
{
	{
		"telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzf-native.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"HUAHUAI23/telescope-dapzzzz",
			build = "make",
			config = function() end,
		},
		keys = {
			{
				";f",
				function()
					local builtin = require("telescope.builtin")
					builtin.find_files({
						no_ignore = false,
						hidden = true,
						file_ignore_patterns = {
							".git/.*",
							"node_modules/.*",
						},
					})
				end,
				desc = "Lists files in your current working directory, respects .gitignore",
			},
			{
				";r",
				function()
					local builtin = require("telescope.builtin")
					builtin.live_grep({
						file_ignore_patterns = {
							".git/.*",
							"node_modules/.*",
						},
					})
				end,
				desc = "Search for a string in your current working directory and get results live as you type, respects .gitignore",
			},
			{
				"fe",
				function()
					local builtin = require("telescope.builtin")
					builtin.buffers()
				end,
				desc = "Lists open buffers",
			},
			{
				";t",
				function()
					local builtin = require("telescope.builtin")
					builtin.help_tags()
				end,
				desc = "Lists available help tags and opens a new window with the relevant help info on <cr>",
			},
			{
				";;",
				function()
					local builtin = require("telescope.builtin")
					builtin.resume()
				end,
				desc = "Resume the previous telescope picker",
			},
			{
				";e",
				function()
					local builtin = require("telescope.builtin")
					builtin.diagnostics()
				end,
				desc = "Lists Diagnostics for all open buffers or a specific buffer",
			},
			{
				";s",
				function()
					local builtin = require("telescope.builtin")
					builtin.treesitter()
				end,
				desc = "Lists Function names, variables, from Treesitter",
			},
			{
				"fs",
				function()
					local telescope = require("telescope")

					local function telescope_buffer_dir()
						return vim.fn.expand("%:p:h")
					end

					telescope.extensions.file_browser.file_browser({
						path = "%:p:h",
						cwd = telescope_buffer_dir(),
						respect_gitignore = false,
						hidden = true,
						grouped = true,
						previewer = false,
						initial_mode = "normal",
						layout_config = { height = 40 },
					})
				end,
				desc = "Open File Browser with the path of the current buffer",
			},
		},
		config = function(_, opts)
			local telescope = require("telescope")
			local actions = require("telescope.actions")
			local fb_actions = require("telescope").extensions.file_browser.actions

			local ts_select_dir_for_grep = function(prompt_bufnr)
				local action_state = require("telescope.actions.state")
				local fb = require("telescope").extensions.file_browser
				local live_grep = require("telescope.builtin").live_grep
				local current_line = action_state.get_current_line()

				fb.file_browser({
					files = false,
					depth = false,
					attach_mappings = function(prompt_bufnr)
						require("telescope.actions").select_default:replace(function()
							local entry_path = action_state.get_selected_entry().Path
							local dir = entry_path:is_dir() and entry_path or entry_path:parent()
							local relative = dir:make_relative(vim.fn.getcwd())
							local absolute = dir:absolute()

							live_grep({
								results_title = relative .. "/",
								cwd = absolute,
								default_text = current_line,
							})
						end)

						return true
					end,
				})
			end

			opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
				wrap_results = true,
				theme = "dropdown",
				layout_strategy = "horizontal",
				layout_config = {
					width = function(_, cols, _)
						if cols > 200 then
							return 170
						else
							return math.floor(cols * 0.87)
						end
					end,
					preview_cutoff = 10,
				},
				sorting_strategy = "ascending",
				winblend = 0,
				mappings = {
					n = {
						["l"] = actions.select_default,
						["s"] = actions.file_vsplit,
					},
				},
			})

			opts.pickers = {
				diagnostics = {
					theme = "dropdown",
					initial_mode = "normal",
					layout_config = {
						width = function(_, cols, _)
							if cols > 200 then
								return 170
							else
								return math.floor(cols * 0.87)
							end
						end,
						preview_cutoff = 100,
					},
				},
				buffers = {
					theme = "dropdown",
					initial_mode = "insert",
					layout_config = {
						width = function(_, cols, _)
							if cols > 200 then
								return 170
							else
								return math.floor(cols * 0.87)
							end
						end,
						preview_cutoff = 100,
					},
				},
				live_grep = {
					theme = "dropdown",
					layout_config = {
						width = function(_, cols, _)
							if cols > 200 then
								return 170
							else
								return math.floor(cols * 0.87)
							end
						end,
						preview_cutoff = 100,
					},
					mappings = {
						i = {
							["<C-f>"] = ts_select_dir_for_grep,
						},
						n = {
							["<C-f>"] = ts_select_dir_for_grep,
						},
					},
				},
				find_files = {
					theme = "dropdown",
					initial_mode = "insert",
					layout_config = {
						width = function(_, cols, _)
							if cols > 200 then
								return 170
							else
								return math.floor(cols * 0.87)
							end
						end,
						preview_cutoff = 100,
					},
				},
			}
			opts.extensions = {
				file_browser = {
					theme = "dropdown",
					-- disables netrw and use telescope-file-browser in its place
					hijack_netrw = true,
					mappings = {
						-- your custom insert mode mappings
						["n"] = {
							-- your custom normal mode mappings
							["N"] = fb_actions.create,
							["r"] = fb_actions.rename,
							["y"] = fb_actions.copy,
							["h"] = fb_actions.goto_parent_dir,
							["/"] = function()
								vim.cmd("startinsert")
							end,
							["<C-u>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_previous(prompt_bufnr)
								end
							end,
							["<C-d>"] = function(prompt_bufnr)
								for i = 1, 10 do
									actions.move_selection_next(prompt_bufnr)
								end
							end,
							["<PageUp>"] = actions.preview_scrolling_up,
							["<PageDown>"] = actions.preview_scrolling_down,
						},
					},
				},
			}

			telescope.setup(opts)
			require("telescope").load_extension("fzf")
			require("telescope").load_extension("file_browser")
			require("telescope").load_extension("dap")
			require("telescope").load_extension("i23")

			local function augroup(name)
				return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
			end

			vim.api.nvim_create_autocmd("VimEnter", {
				group = augroup("telescope_startup"),
				callback = function()
					if vim.fn.argv(0) == "" then
						require("telescope.builtin").find_files({
							no_ignore = false,
							hidden = true,
							file_ignore_patterns = {
								".git/.*",
								"node_modules/.*",
							},
						})
					end
				end,
			})
		end,
	},
}
