-- lua/configs/nvim-cmp.lua
local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
	return
end

local luasnip_status, luasnip = pcall(require, "luasnip")
if not luasnip_status then
	return
end

-- Load friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- CMP setup
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	}, {
		{ name = "buffer" },
		{ name = "path" },
	}),
})

-- Setup capabilities for LSP servers
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Define LSP servers with the new vim.lsp.config API
local servers = { "pyright", "ts_ls", "gopls", "rust_analyzer" }

for _, server in ipairs(servers) do
	vim.lsp.config[server] = {
		capabilities = capabilities,
	}
	vim.lsp.enable(server)
end
