return {
	-- lua/configs/mason.lua
local mason_status, mason = pcall(require, "mason")
if mason_status then
  mason.setup()
end

local mason_lsp_status, mason_lsp = pcall(require, "mason-lspconfig")
if mason_lsp_status then
  mason_lsp.setup({
    ensure_installed = { "pyright", "tsserver", "gopls", "rust_analyzer" },
  })
end

	PATH = "skip",

	ui = {
		icons = {
			package_pending = " ",
			package_installed = " ",
			package_uninstalled = " ",
		},
	},

	max_concurrent_installers = 10,
}
