-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	-- Enable completion triggered by <c-x><c-o>
	vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lspconfig")["gopls"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	-- Server-specific settings...
})

local lspconfig = require("lspconfig")
lspconfig.golangci_lint_ls.setup({
	filetypes = { "go", "gomod" },
})

require("lspconfig")["sumneko_lua"].setup({
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {},
})

-- diagnostics
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	-- Disable underline, it's very annoying
	underline = false,
	virtual_text = true,
	-- Enable virtual text, override spacing to 4
	-- virtual_text = {spacing = 4},
	-- Use a function to dynamically turn signs off
	-- and on, using buffer local variables
	signs = true,
	update_in_insert = false,
})
