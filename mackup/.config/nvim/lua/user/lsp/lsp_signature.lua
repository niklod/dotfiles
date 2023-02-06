local present, signature = pcall(require, "lsp_signature")

if not present then
	return
end

signature.setup({}) -- no need to specify bufnr if you don't use toggle_key
