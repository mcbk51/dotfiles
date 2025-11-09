-- plugins/mason.lua
return {
	"williamboman/mason.nvim",
	cmd = { "Mason", "MasonInstall", "MasonUpdate" },
	{ "williamboman/mason-lspconfig.nvim", dependencies = { "mason.nvim" } },
	{ "neovim/nvim-lspconfig" }, -- required for LSP integration
	config = function()
		require("configs.mason")
	end,
}
