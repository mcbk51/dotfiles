local lspconfig = require "lspconfig"

local servers = { "html", "cssls", "lua_ls", "pyright", "bashls", "gopls" }

-- Setup each LSP server
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {}
end
