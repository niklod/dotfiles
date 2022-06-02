local ok, lspinstaller = pcall(require, "nvim-lsp-installer")
if not ok then
  return
end


lspinstaller.setup({
  ensure_installed = {
    'bashls',
    'dockerls',
    'jsonls',
    'sumneko_lua',
    'yamlls',
    'gopls',
    'jdtls',
    'jsonls',
    'yamlls',
  },
  automatic_installation = true
})
