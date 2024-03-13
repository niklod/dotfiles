-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap("n", "x", '"_x', opts)

keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

keymap("x", "p", "P")

keymap("n", "n", "nzzzv", opts)
keymap("n", "N", "Nzzzv", opts)
keymap("n", "zz", "ZZ", opts)

keymap({ "n", "v", "o" }, "H", "^", opts)
keymap({ "n", "v", "o" }, "L", "g_", opts)

keymap("v", "J", ":move '>+1<CR>gv-gv", opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", opts)

keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

keymap("n", "gt", ":A<CR>", opts)

-- Increment/decrement
keymap("n", "+", "<C-a>")
keymap("n", "-", "<C-x>")

-- Delete a word backwards
keymap("n", "dw", 'vb"_d')

-- Select all
keymap("n", "<C-a>", "gg<S-v>G")

-- Disable continuations
keymap("n", "<Leader>o", "o<Esc>^Da", opts)
keymap("n", "<Leader>O", "O<Esc>^Da", opts)

-- Diagnostics
keymap("n", "<C-m>", function()
	vim.diagnostic.goto_next()
end, opts)

-- Golang stuff
keymap("n", "<leader>at", ":GoAddTag json <CR>", opts)
keymap("n", "<leader>r", ":GoIfErr<CR>", opts)

-- Unbing
keymap({ "n", "v" }, "<M-j>", "<M-j>", {})
keymap({ "n", "v" }, "<M-k>", "<M-k>", {})
