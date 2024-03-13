-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local opt = vim.opt

vim.g.autoindent = true
vim.g.smartindent = true
vim.g.backup = false
vim.g.showcmd = true
vim.g.cmdheight = 1
vim.g.laststatus = 2
vim.g.breakindent = true
vim.g.mouse = ""
vim.g.title = true
vim.g.shell = "fish"
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_proxy = "blade:pqmt5fg12b@188.166.1.235:44455"
vim.g.copilot_tab_fallback = ""

vim.g.spell = true

opt.conceallevel = 0 -- Enable auto write

if vim.fn.has("nvim-0.8") == 1 then
	vim.opt.cmdheight = 0
end
