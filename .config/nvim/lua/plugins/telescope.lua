return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope-file-browser.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-smart-history.nvim",
		{
			"nvim-telescope/telescope-frecency.nvim",
			version = "*",
			dependencies = { "kkharji/sqlite.lua" },
			config = function()
				require("telescope").load_extension("frecency")
			end,
		},
	},
	config = function()
		local telescope = require("telescope")
		telescope.setup(require("plugins.telescope"))
		telescope.load_extension("fzf")
		telescope.load_extension("smart_history")
		telescope.load_extension("frecency")
	end,
}
