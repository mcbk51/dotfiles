local configs = require("nvim-treesitter.configs")
configs.setup({

	ensure_installed = {
		"lua",
		"vim",
		"go",
		"python",
		"bash",
		"json",
		"yaml",
		"html",
		"css",
		"markdown",
	},
	auto_install = true,

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
