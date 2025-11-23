-- lua/bk/configs/themes.lua

-- Load Tokyo Night as default
require("tokyonight").setup({
	style = "night",
	transparent = false,
	terminal_colors = true,
})
-- vim.cmd("colorscheme tokyonight")

-- Optional: configure other themes without enabling them yet
pcall(function()
	require("ayu").setup({ mirage = false, overrides = {} })
end)

pcall(function()
	require("moonfly").setup({})
end)

pcall(function()
require("base16").setup({
})
end)

pcall(function()
	require("iceberg").setup({})
end)

pcall(function()
	require("horizon").setup({})
end)

pcall(function()
	require("oxocarbon").setup({})
end)

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

vim.cmd("colorscheme onedark")
