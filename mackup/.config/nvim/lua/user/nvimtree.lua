local present, nvimtree = pcall(require, "nvim-tree")


if not present then
   return
end

nvimtree.setup({
      auto_reload_on_write = true,
      create_in_closed_folder = false,
      disable_netrw = false,
      hijack_cursor = false,
      hijack_netrw = true,
      hijack_unnamed_buffer_when_opening = false,
      ignore_buffer_on_setup = false,
      open_on_setup = false,
      open_on_setup_file = false,
      open_on_tab = false,
      sort_by = "name",
      root_dirs = {},
      prefer_startup_root = false,
      sync_root_with_cwd = false,
      reload_on_bufenter = false,
      respect_buf_cwd = false,
      view = {
        adaptive_size = true,
        centralize_selection = false,
        width = 60,
        height = 30,
        hide_root_folder = true,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        mappings = {
          custom_only = false,
          list = {
            { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
            { key = "<C-e>",                          action = "edit_in_place" },
            { key = "O",                              action = "edit_no_picker" },
            { key = { "<C-]>", "<2-RightMouse>" },    action = "cd" },
            { key = "<C-v>",                          action = "vsplit" },
            { key = "<C-x>",                          action = "split" },
            { key = "<C-t>",                          action = "tabnew" },
            { key = "<",                              action = "prev_sibling" },
            { key = ">",                              action = "next_sibling" },
            { key = "P",                              action = "parent_node" },
            { key = "<BS>",                           action = "close_node" },
            { key = "<Tab>",                          action = "preview" },
            { key = "K",                              action = "first_sibling" },
            { key = "J",                              action = "last_sibling" },
            { key = "I",                              action = "toggle_git_ignored" },
            { key = "H",                              action = "toggle_dotfiles" },
            { key = "U",                              action = "toggle_custom" },
            { key = "R",                              action = "refresh" },
            { key = "a",                              action = "create" },
            { key = "d",                              action = "remove" },
            { key = "D",                              action = "trash" },
            { key = "r",                              action = "rename" },
            { key = "<C-r>",                          action = "full_rename" },
            { key = "x",                              action = "cut" },
            { key = "c",                              action = "copy" },
            { key = "p",                              action = "paste" },
            { key = "y",                              action = "copy_name" },
            { key = "Y",                              action = "copy_path" },
            { key = "gy",                             action = "copy_absolute_path" },
            { key = "[e",                             action = "prev_diag_item" },
            { key = "[c",                             action = "prev_git_item" },
            { key = "]e",                             action = "next_diag_item" },
            { key = "]c",                             action = "next_git_item" },
            { key = "-",                              action = "dir_up" },
            { key = "s",                              action = "system_open" },
            { key = "f",                              action = "live_filter" },
            { key = "F",                              action = "clear_live_filter" },
            { key = "q",                              action = "close" },
            { key = "W",                              action = "collapse_all" },
            { key = "E",                              action = "expand_all" },
            { key = "S",                              action = "search_node" },
            { key = ".",                              action = "run_file_command" },
            { key = "<C-k>",                          action = "toggle_file_info" },
            { key = "g?",                             action = "toggle_help" },
          },
        },
      },
      renderer = {
        add_trailing = false,
        group_empty = false,
        highlight_git = false,
        full_name = false,
        highlight_opened_files = "null",
        root_folder_modifier = ":~",
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            item = "│ ",
            none = "  ",
          },
        },
        icons = {
          webdev_colors = true,
          git_placement = "before",
          padding = " ",
          symlink_arrow = " ➛ ",
          show = {
            file = true,
            folder = true,
            folder_arrow = true,
            git = true,
          },
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_closed = "",
              arrow_open = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "✗",
              staged = "✓",
              unmerged = "",
              renamed = "➜",
              untracked = "★",
              deleted = "",
              ignored = "◌",
            },
          },
        },
        special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md", "go.mod", "go.sum" },
        symlink_destination = true,
      },
      hijack_directories = {
        enable = true,
        auto_open = true,
      },
      update_focused_file = {
        enable = true,
        update_root = true,
        ignore_list = {},
      },
      ignore_ft_on_setup = {},
      system_open = {
        cmd = "",
        args = {},
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = "",
          info = "",
          warning = "",
          error = "",
        },
      },
      filters = {
        dotfiles = false,
        custom = {},
        exclude = {},
      },
      filesystem_watchers = {
        enable = true,
        interval = 100,
        debounce_delay = 50,
      },
      git = {
        enable = true,
        ignore = false,
        show_on_dirs = true,
        timeout = 400,
      },
      actions = {
        use_system_clipboard = true,
        change_dir = {
          enable = true,
          global = false,
          restrict_above_cwd = false,
        },
        expand_all = {
          max_folder_discovery = 300,
          exclude = {},
        },
        open_file = {
          quit_on_open = false,
          resize_window = true,
          window_picker = {
            enable = true,
            chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
            exclude = {
              filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
              buftype = { "nofile", "terminal", "help" },
            },
          },
        },
        remove_file = {
          close_window = true,
        },
      },
      trash = {
        cmd = "gio trash",
        require_confirm = true,
      },
      live_filter = {
        prefix = "[FILTER]: ",
        always_show_folders = true,
      },
      log = {
        enable = false,
        truncate = false,
        types = {
          all = false,
          config = false,
          copy_paste = false,
          diagnostics = false,
          git = false,
          profile = false,
          watcher = false,
        },
      },
    })

-- local g = vim.g

-- g.nvim_tree_add_trailing = 0 -- append a trailing slash to folder names
-- g.nvim_tree_git_hl = 1
-- g.nvim_tree_highlight_opened_files = 1
-- g.nvim_tree_indent_markers = 0
-- g.nvim_tree_quit_on_open = 1 -- closes tree when file's opened
-- g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

-- g.nvim_tree_window_picker_exclude = {
--    filetype = { "notify", "packer", "qf" },
--    buftype = { "terminal" },
-- }

-- g.nvim_tree_show_icons = {
--    folders = 1,
--    files = 1,
--    git = 1,
-- }

-- g.nvim_tree_icons = {
--    default = "",
--    symlink = "",
--    git = {
--       deleted = "",
--       ignored = "◌",
--       renamed = "➜",
--       staged = "✓",
--       unmerged = "",
--       unstaged = "✗",
--       untracked = "★",
--    },
--    folder = {
--       default = "",
--       empty = "",
--       empty_open = "",
--       open = "",
--       symlink = "",
--       symlink_open = "",
--    },
-- }

-- local list = {
--   { key = {"<CR>", "o", "<2-LeftMouse>"}, action = "edit" },
--   { key = {"O"},                          action = "edit_no_picker" },
--   { key = {"<2-RightMouse>", "<C-]>"},    action = "cd" },
--   { key = "<C-v>",                        action = "vsplit" },
--   { key = "<C-x>",                        action = "split" },
--   { key = "<C-t>",                        action = "tabnew" },
--   { key = "<",                            action = "prev_sibling" },
--   { key = ">",                            action = "next_sibling" },
--   { key = "P",                            action = "parent_node" },
--   { key = "<BS>",                         action = "close_node" },
--   { key = "<Tab>",                        action = "preview" },
--   { key = "K",                            action = "first_sibling" },
--   { key = "J",                            action = "last_sibling" },
--   { key = "I",                            action = "toggle_ignored" },
--   { key = "H",                            action = "toggle_dotfiles" },
--   { key = "R",                            action = "refresh" },
--   { key = "a",                            action = "create" },
--   { key = "d",                            action = "remove" },
--   { key = "D",                            action = "trash" },
--   { key = "r",                            action = "rename" },
--   { key = "<C-r>",                        action = "full_rename" },
--   { key = "x",                            action = "cut" },
--   { key = "c",                            action = "copy" },
--   { key = "p",                            action = "paste" },
--   { key = "y",                            action = "copy_name" },
--   { key = "Y",                            action = "copy_path" },
--   { key = "gy",                           action = "copy_absolute_path" },
--   { key = "[c",                           action = "prev_git_item" },
--   { key = "]c",                           action = "next_git_item" },
--   { key = "-",                            action = "dir_up" },
--   { key = "s",                            action = "system_open" },
--   { key = "f",                        action = "live_filter" },
--   { key = "<C-F>",                        action = "clear_live_filter" },
--   { key = "f",                        action = "" },
--   { key = "q",                            action = "close" },
--   { key = "g?",                           action = "toggle_help" },
-- }

-- require'nvim-tree'.setup {
--   auto_reload_on_write = true,
--   disable_netrw       = true,
--   hijack_netrw        = true,
--   open_on_setup       = false,
--   ignore_ft_on_setup  = {},
--   auto_close          = true,
--   open_on_tab         = false,
--   hijack_cursor       = true,
--   update_cwd          = false,
--   update_to_buf_dir   = {
--     enable = true,
--     auto_open = true,
--   },
--   diagnostics = {
--     enable = true,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
--   update_focused_file = {
--     enable      = true,
--     update_cwd  = false,
--     ignore_list = {}
--   },
--   system_open = {
--     cmd  = nil,
--     args = {}
--   },
--   filters = {
--     dotfiles = true,
--     custom = {"^.git/"}
--   },
--   git = {
--     enable = true,
--     ignore = false,
--     timeout = 500,
--   },
--   view = {
--     width = 60,
--     height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     auto_resize = true,
--     mappings = {
--       custom_only = false,
--       list = list
--     },
--     number = false,
--     relativenumber = false,
--     signcolumn = "yes"
--   },
--   trash = {
--     cmd = "trash",
--     require_confirm = true
--   }
-- }
