lua require("user.plugins")

lua require("user.lspinstaller")
lua require("user.treesitter")
lua require("user.treesitter_textobjects")
lua require("user.go_nvim")
lua require("user.nvimtree")
lua require("user.git_signs")
lua require("user.lua_line")
lua require("user.cmp_autocompletion")
lua require("user.lsp")
lua require("user.telescope")
lua require("user.harpoon")
" lua require("user.diffview")
lua require("user.trouble")
lua require("user.mappings")
lua require("user.settings")
lua require("user.gocmd")
lua require("user.dap_go")
lua require("user.one_dark")
lua require("user.hop")
" lua require("user.autosave")

autocmd BufWritePre *.go :silent! lua require('go.format').goimport()
