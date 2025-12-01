return {
	"xiyaowong/transparent.nvim",
	priority = 1000,
	config = function()
		local transparent = require("transparent")

		transparent.setup({
			extra_groups = {
				-- WhichKey
				"WhichKey",
				"WhichKeyFloat",
				"WhichKeyBorder",
				"WhichKeyGroup",
				"WhichKeyDesc",
				"WhichKeySeparator",

				-- MiniFiles
				"MiniFilesNormal",
				"MiniFilesBorder",
				"MiniFilesTitle",
				"MiniFilesTitleFocused",

				-- Harpoon
				"NormalFloat",
				"FloatBorder",
				"HarpoonWindow",
				"HarpoonBorder",

				-- Popup menu
				"Pmenu",
				"PmenuSel",
				"PmenuSbar",
				"PmenuThumb",

				-- Lualine
				"lualine_b_normal",
				"lualine_b_insert",
				"lualine_b_visual",
				"lualine_b_command",
				"lualine_b_replace",
				"lualine_b_terminal",
				"lualine_c_normal",
				"lualine_c_insert",
				"lualine_c_visual",
				"lualine_c_command",
				"lualine_c_replace",
				"lualine_c_terminal",
				"lualine_x_normal",
				"lualine_x_insert",
				"lualine_x_visual",
				"lualine_x_command",
				"lualine_x_replace",
				"lualine_x_terminal",
				"lualine_y_normal",
				"lualine_y_insert",
				"lualine_y_visual",
				"lualine_y_command",
				"lualine_y_replace",
				"lualine_y_terminal",
				"lualine_z_normal",
				"lualine_z_insert",
				"lualine_z_visual",
				"lualine_z_command",
				"lualine_z_replace",
				"lualine_z_terminal",
				"lualine_c_inactive",
				"lualine_x_inactive",
				"lualine_y_inactive",
				"lualine_z_inactive",
			},
		})

		-- Clear prefixes once
		transparent.clear_prefix("MiniFiles")
		transparent.clear_prefix("WhichKey")
	end,
}
