-- use this table to disable/enable filetypes
vim.g.copilot_filetypes={ xml = false, markdown = false }

-- since most are enabled by default you can turn them off
-- using this table and only enable for a few filetypes a
-- vim.g. copilot_filetypes = { ["*"] = false, python = true
--
vim.api.nvim_set_keymap("i", "<C-j>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.g.copilot_no_tab_map=true
-- vim.keymap.set.keymap("i", "<C-a>", ":copilot#Accept('\ \<CR>")<CR>", { silent = true })

vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
