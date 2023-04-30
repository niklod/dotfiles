-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
keymap("n", "gw", "*N")
keymap("x", "gw", "*N")
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
keymap("n", "zz", "ZZ", default_opts)
keymap({ "n", "v", "o" }, "H", "^", default_opts)
keymap({ "n", "v", "o" }, "L", "g_", default_opts)
keymap("v", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", default_opts)
keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)
keymap("n", "gt", ":A<CR>", default_opts)
keymap("n", "<leader>at", ":GoAddTag", default_opts)

-- Unbing
keymap({ "n", "v" }, "<M-j>", "<M-j>", {})
keymap({ "n", "v" }, "<M-k>", "<M-k>", {})
