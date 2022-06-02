require 'user.lsp.docker'
require 'user.lsp.go'
require 'user.lsp.json'
require 'user.lsp.lua'
require 'user.lsp.toml'
require 'user.lsp.yaml'
require 'user.lsp.bash'

  local signs = {
    { name = "DiagnosticSignError", text = "💢" },
    { name = "DiagnosticSignWarn", text = "⚠️" },
    { name = "DiagnosticSignHint", text = "❔" },
    { name = "DiagnosticSignInfo", text = "❕" },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end
