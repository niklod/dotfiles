local keymap = vim.keymap.set
local default_opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "<Leader>e", ":NvimTreeToggle<CR>", default_opts)

-- keymap('n', '<Leader>n', ':nohl<CR>', default_opts)
keymap({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

keymap("n", "gw", "*N")
keymap("x", "gw", "*N")

-- Movements
keymap("n", "n", "nzzzv", default_opts)
keymap("n", "N", "Nzzzv", default_opts)
keymap("n", "zz", "ZZ", default_opts)

keymap({ "n", "v", "o" }, "H", "^", default_opts)
keymap({ "n", "v", "o" }, "L", "g_", default_opts)

keymap("v", "J", ":move '>+1<CR>gv-gv", default_opts)
keymap("v", "K", ":move '<-2<CR>gv-gv", default_opts)

keymap("v", "p", '"_dP', default_opts)

keymap("n", "Y", "yg_", default_opts)
keymap("n", "J", "mzJ`z", default_opts)

keymap("n", "<C-h>", "<C-w>h", default_opts)
keymap("n", "<C-j>", "<C-w>j", default_opts)
keymap("n", "<C-k>", "<C-w>k", default_opts)
keymap("n", "<C-l>", "<C-w>l", default_opts)

keymap("v", "<", "<gv", default_opts)
keymap("v", ">", ">gv", default_opts)

keymap("n", "<Leader>a", ":TSTextobjectSwapNext @parameter.inner<CR>", default_opts)
keymap("n", "<Leader>A", ":TSTextobjectSwapPrevious @parameter.inner<CR>", default_opts)
keymap("n", "gt", ":A<CR>", default_opts)

-- require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })

-- keymap('n', 'fa', ":HopWord<CR>", {})
-- keymap('n', 't', ":lua require('hop').hint_words({ direction = require('hop.hint').HintDirection.AFTER_CURSOR, current_line_only = true })<CR>", default_opts)
-- keymap('n', 'T', ":lua require('hop').hint_words({ direction = require('hop.hint').HintDirection.BEFORE_CURSOR, current_line_only = true })<CR>", default_opts)
-- keymap('v', 't', ":HopChar2<CR>", {})

keymap("n", "<leader>at", ":GoAddTag", {})

-- Search
keymap("n", "ff", ":Telescope find_files<CR>", default_opts)
keymap("n", "fl", ":Telescope live_grep<CR>", default_opts)
keymap("n", "gr", ":Telescope lsp_references<CR>", default_opts)
keymap("n", "fs", [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], default_opts)
keymap("n", "fe", "<Cmd>lua require('telescope.builtin').buffers()<CR>", default_opts)

-- Git
keymap("n", "<Leader>sh", ":Gitsigns stage_hunk<CR>", default_opts)
keymap("n", "<Leader>uh", ":Gitsigns undo_stage_hunk<CR>", default_opts)
keymap("n", "<Leader>rh", ":Gitsigns reset_hunk<CR>", default_opts)

-- Debugger
keymap("n", ",d", ":GoDebug<CR>", default_opts)
keymap("n", ",c", [[<Cmd>lua require('dap').continue()<CR>]], default_opts)
keymap("n", ",b", ":GoBreakToggle<CR>", default_opts)
keymap("n", ",t", ":GoDebug -n<CR>", default_opts)
keymap("n", "<Leader>dk", ":GoDbgStop<CR>", default_opts)
keymap("n", "<F5>", [[<Cmd>lua require('dap').step_over()<CR>]], default_opts)
keymap("n", "<F6>", [[<Cmd>lua require('dap').step_into()<CR>]], default_opts)
keymap({ "n", "v" }, ",dp", [[<Cmd>lua require('dapui').eval()<CR>]], default_opts)
keymap("n", "<Leader>du", [[<Cmd>lua require('dapui').toggle()<CR>]], default_opts)

-- lsp
keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", default_opts)
keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", default_opts)
-- keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", default_opts)
keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", default_opts)
keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", default_opts)
keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", default_opts)
keymap("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", default_opts)
keymap({ "n", "v" }, "<leader>ca", "<cmd>Lspsaga code_action<CR>", default_opts)
keymap("n", "fn", "<cmd>Lspsaga diagnostic_jump_prev<CR>", default_opts)
keymap("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", default_opts)
keymap("n", "fp", "<cmd>Lspsaga diagnostic_jump_next<CR>", default_opts)
keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", default_opts)
