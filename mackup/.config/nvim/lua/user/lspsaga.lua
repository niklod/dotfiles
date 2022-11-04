local saga = require("lspsaga")

saga.init_lsp_saga({
 -- "single" | "double" | "rounded" | "bold" | "plus"
  border_style = "single",
  -- same as nvim-lightbulb but async
  code_action_lightbulb = {
    enable = false,
  },
  rename_in_select = false,
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    tabe = "t",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  rename_action_quit = ";",
  })
