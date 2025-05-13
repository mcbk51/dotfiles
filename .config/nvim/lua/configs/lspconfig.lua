require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "lua_ls", "pyright", "bashls" }
vim.lsp.enable(servers)
