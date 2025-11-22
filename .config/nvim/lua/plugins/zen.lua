return {
	{
		"folke/zen-mode.nvim",
		config = function()
			require("zen-mode").setup({
				window = {
					height = 90,
					options = {},
				},
			})

			require("twilight").setup({
				context = -1,
				treesitter = true,
			})
		end,
	},

	{
		"folke/twilight.nvim",
		config = function()
			require("twilight").setup({
				context = -1,
				treesitter = true,
			})
		end,
	},
}
