-- lua/bk/configs/themes.lua

-- Load Tokyo Night as default
require("tokyonight").setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
})
vim.cmd("colorscheme tokyonight")

-- Optional: configure other themes without enabling them yet
require("ayu").setup({ mirage = false, overrides = {} })

require("catppuccin").setup({
	flavour = "mocha",
	transparent_background = false,
	integrations = { treesitter = true, cmp = true, gitsigns = true, telescope = true },
})

require("decay").setup({
	style = "dark",
	italics = { code = false, comments = true },
})

require("onedark").setup({
	style = "dark",
	transparent = false,
	code_style = {
		comments = "italic",
		keywords = "bold",
		functions = "none",
		strings = "none",
		variables = "none",
	},
})

-- You can configure other themes similarly but do not call vim.cmd("colorscheme ...") yet
-- require("oxocarbon").setup({})
-- require("radium").setup({})
