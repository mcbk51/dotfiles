return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.files").setup()
		require("mini.ai").setup()
	end,
}
