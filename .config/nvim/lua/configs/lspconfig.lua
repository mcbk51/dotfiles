require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "lua_ls", "pyright", "bashls", "gopls" }
vim.lsp.enable(servers)
