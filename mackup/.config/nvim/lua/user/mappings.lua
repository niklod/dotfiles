local v = vim.api

local default_opts = { noremap = true, silent = true }

vim.g.mapleader = " "
vim.g.maplocalleader = " "


v.nvim_set_keymap('n', '<Leader>e', ':NvimTreeToggle<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>n', ':nohl<CR>', default_opts)

--Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Movements
v.nvim_set_keymap('n', 'n', 'nzzzv', default_opts)
v.nvim_set_keymap('n', 'N', 'Nzzzv', default_opts)

v.nvim_set_keymap("x", "J", ":move '>+1<CR>gv-gv", default_opts)
v.nvim_set_keymap("x", "K", ":move '<-2<CR>gv-gv", default_opts)

v.nvim_set_keymap("x", "<Leader>p", '"_dP', default_opts)

v.nvim_set_keymap("n", "<Leader>y", '"+y', default_opts)
v.nvim_set_keymap("v", "<Leader>y", '"+y', default_opts)
v.nvim_set_keymap("v", "<Leader>Y", '"+Y', default_opts)

v.nvim_set_keymap("n", "<Leader>d", '"_d', default_opts)
v.nvim_set_keymap("v", "<Leader>d", '"_d', default_opts)

v.nvim_set_keymap('n', "Y", "yg$", default_opts)
v.nvim_set_keymap('n', "J", "mzJ`z", default_opts)

v.nvim_set_keymap('n', '<C-h>', '<C-w>h', default_opts)
v.nvim_set_keymap('n', '<C-j>', '<C-w>j', default_opts)
v.nvim_set_keymap('n', '<C-k>', '<C-w>k', default_opts)
v.nvim_set_keymap('n', '<C-l>', '<C-w>l', default_opts)

v.nvim_set_keymap('v', '<', '<gv', default_opts)
v.nvim_set_keymap('v', '>', '>gv', default_opts)

v.nvim_set_keymap('n', '<Leader>a', ':TSTextobjectSwapNext @parameter.inner<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>A', ':TSTextobjectSwapPrevious @parameter.inner<CR>', default_opts)

v.nvim_set_keymap('o', 'fa', ":HopWord<CR>", {})
v.nvim_set_keymap('n', 'fa', ":HopWord<CR>", {})
v.nvim_set_keymap('v', 'fa', ":HopWord<CR>", {})

v.nvim_set_keymap('n', '<leader>at', ":GoAddTag", {})

v.nvim_set_keymap('n', '<Leader>so', [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], default_opts)

-- Diagnostics
v.nvim_set_keymap('n', '<Leader>xx', ':TroubleToggle document_diagnostics<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>xw', ':TroubleToggle workspace_diagnostics<CR>', default_opts)

-- Search
v.nvim_set_keymap('n', 'ff', ':Telescope find_files<CR>', default_opts)
v.nvim_set_keymap('n', 'fl', ':Telescope live_grep<CR>', default_opts)
v.nvim_set_keymap('n', 'gr', ':Telescope lsp_references<CR>', default_opts)
v.nvim_set_keymap('n', 'fs', [[<Cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>]], default_opts)
v.nvim_set_keymap("n", "fe", "<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>", default_opts)

-- Git
v.nvim_set_keymap('n', '<Leader>gb', ':Telescope git_branches<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>sh', ':Gitsigns stage_hunk<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>uh', ':Gitsigns undo_stage_hunk<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>rh', ':Gitsigns reset_hunk<CR>', default_opts)

v.nvim_set_keymap('n', '<Leader>gd', ':DiffviewOpen<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>gq', ':DiffviewClose<CR>', default_opts)
-- v.nvim_set_keymap('n', 'gj', ':diffget //3', default_opts)
-- v.nvim_set_keymap('n', 'gf', ':diffget //2', default_opts)

-- Harpoon
v.nvim_set_keymap('n', 'rr', [[<Cmd>lua require('harpoon.mark').add_file()<CR>]], default_opts)
v.nvim_set_keymap('n', '<C-e>', [[<Cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>1', [[<Cmd>lua require('harpoon.ui').nav_file(1)<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>2', [[<Cmd>lua require('harpoon.ui').nav_file(2)<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>3', [[<Cmd>lua require('harpoon.ui').nav_file(3)<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>4', [[<Cmd>lua require('harpoon.ui').nav_file(4)<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>5', [[<Cmd>lua require('harpoon.ui').nav_file(5)<CR>]], default_opts)

-- Debugger
v.nvim_set_keymap('n', ',d', ':GoDebug<CR>', default_opts)
v.nvim_set_keymap('n', ',c', [[<Cmd>lua require('dap').continue()<CR>]], default_opts)
v.nvim_set_keymap('n', ',b', ':GoBreakToggle<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>dt', ':GoDebug -n<CR>', default_opts)
v.nvim_set_keymap('n', '<Leader>dk', ':GoDbgStop<CR>', default_opts)

v.nvim_set_keymap('n', '<F5>', [[<Cmd>lua require('dap').step_over()<CR>]], default_opts)
v.nvim_set_keymap('n', '<F6>', [[<Cmd>lua require('dap').step_into()<CR>]], default_opts)

v.nvim_set_keymap('v', ',dp', [[<Cmd>lua require('dapui').eval()<CR>]], default_opts)
v.nvim_set_keymap('n', ',dp', [[<Cmd>lua require('dapui').eval()<CR>]], default_opts)
v.nvim_set_keymap('n', '<Leader>du', [[<Cmd>lua require('dapui').toggle()<CR>]], default_opts)

v.nvim_set_keymap('n', '<Leader>dl', [[<Cmd>lua require('dap.ext.vscode').load_launchjs("./launch.json",{})<CR>]], default_opts)
v.nvim_set_keymap('n', 'd]', [[<Cmd>lua require('dap.ext.vscode').load_launchjs("./launch.json",{})<CR>]], default_opts)

-- lsp
v.nvim_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", default_opts)
v.nvim_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", default_opts)
v.nvim_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", default_opts)
v.nvim_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", default_opts)
v.nvim_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", default_opts)
v.nvim_set_keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", default_opts)
v.nvim_set_keymap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", default_opts)
v.nvim_set_keymap("n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "rounded" })<CR>', default_opts)
v.nvim_set_keymap("n", "gl", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({ border = "rounded" })<CR>', default_opts)
v.nvim_set_keymap("n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "rounded" })<CR>', default_opts)
v.nvim_set_keymap("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", default_opts)
