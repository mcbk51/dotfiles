local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "base16",
		-- theme = "iceberg_dark",
		component_separators = "", -- no separator between components
		section_separators = "",
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = false,
		globalstatus = false,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
			refresh_time = 16, -- ~60fps
			events = {
				"WinEnter",
				"BufEnter",
				"BufWritePost",
				"SessionLoadPost",
				"FileChangedShellPost",
				"VimResized",
				"Filetype",
				"CursorMoved",
				"CursorMovedI",
				"ModeChanged",
			},
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					local mode_map = {
						["NORMAL"] = "N",
						["INSERT"] = "I",
						["VISUAL"] = "V",
						["V-LINE"] = "L",
						["V-BLOCK"] = "B",
						["COMMAND"] = "C",
						["REPLACE"] = "R",
						["TERMINAL"] = "T",
					}
					return mode_map[str] or str:sub(1, 1)
				end,
			},
		},
		lualine_b = {
			"branch",
			{ "filename", color = "Normal" },
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			"encoding",
			"progress",
		},
		lualine_z = {
			{ "location", color = "Normal" },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = { "branch" },
		lualine_c = { "filename" },
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {},
	winbar = {},
	inactive_winbar = {},
	extensions = {},
})
