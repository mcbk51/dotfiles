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

	highlight = {
		enable = true,
	},

	indent = {
		enable = true,
	},
})
