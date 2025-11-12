-- plugins/which-key.lua
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	cmd = "WhichKey",
	keys = {
		{ "<leader>", desc = "Leader Key" },
		{ "<c-w>", desc = "Window" },
		{ '"', desc = "Registers" },
		{ "'", desc = "Marks" },
		{ "`", desc = "Marks" },
		{ "c", mode = { "n", "v" }, desc = "Change" },
		{ "v", mode = { "n" }, desc = "Visual" },
		{ "g", mode = { "n", "v" }, desc = "Goto" },
	},
	opts = {
        preset = "helix",
		plugins = {
			spelling = true,
		},
		win = {
			border = "rounded",
		},
		layout = {
			width = { min = 20 }, -- min and max width of the columns
			spacing = 3,
		},
	},
}
