return {
	"echasnovski/mini.nvim",
	config = function()
		require("mini.files").setup({
                        windows = {
                                preview = true,
                        }
                })
		require("mini.ai").setup()
	end,
}
