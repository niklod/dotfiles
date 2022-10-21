local present, config = pcall(require, "nvim-treesitter.configs")

if not present then
   return
end

config.setup {
textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["aC"] = "@class.outer",
        ["iC"] = "@class.inner",
        ["ac"] = "@conditional.outer",
        ["ic"] = "@conditional.inner",
        ["ae"] = "@block.outer",
        ["ie"] = "@block.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["is"] = "@statement.inner",
        ["as"] = "@statement.outer",
        ["ad"] = "@comment.outer",
        ["am"] = "@call.outer",
        ["im"] = "@call.inner"
      },
        move = {
                enable = enable,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                  ["]m"] = "@function.outer",
                },
                goto_next_end = {
                  ["]M"] = "@function.outer",
                },
                goto_previous_start = {
                  ["[m"] = "@function.outer",
                },
                goto_previous_end = {
                  ["[M"] = "@function.outer",
                }
              },
              select = {
                enable = enable,
                keymaps = {
                  -- You can use the capture groups defined in textobjects.scm
                  ["af"] = "@function.outer",
                  ["if"] = "@function.inner",
                  ["ac"] = "@class.outer",
                  ["ic"] = "@class.inner",
                  -- Or you can define your own textobjects like this
                  ["iF"] = {
                    python = "(function_definition) @function",
                    cpp = "(function_definition) @function",
                    c = "(function_definition) @function",
                    java = "(method_declaration) @function",
                    go = "(method_declaration) @function"
                  }
                }
              },
              swap = {
                enable = enable,
                swap_next = {
                  ["<Leader>a"] = "@parameter.inner"
                },
                swap_previous = {
                  ["<Leader>A"] = "@parameter.inner"
                }
              }
    },
  },
}
