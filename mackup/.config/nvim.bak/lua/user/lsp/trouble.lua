local ok, trouble = pcall(require, "lsp_signature")

if not ok then
	return
end

trouble.setup({})
