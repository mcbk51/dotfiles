return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.files").setup({
			windows = {
				preview = true,
			},
		})
		require("mini.ai").setup()
		require("mini.surround").setup({
			mappings = {
				add = "<leader>sa",
				delete = "<leader>sd",
				find = "<leader>sf",
				find_left = "<leader>sl",
				highlight = "<leader>sh",
				replace = "<leader>sr",
				update_n_lines = "<leader>sn",
			},
		})
	end,
}
