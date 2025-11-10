local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
	return
end
lualine.setup({
	options = {
		icons_enabled = true,
		theme = "ayu_dark",
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
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			{
				"buffers",
				show_modified_status = true,
				mode = 0,
				symbols = {
					alternate_file = "", -- Text to show to identify the alternate file
					directory = "", -- Text to show when the buffer is a directory
				},
			},
		},
		lualine_c = {
			-- { "filename", path = 1, color = "Normal" },
		},
		lualine_x = {
                "encoding",
                {
                        "lsp_status",
                        icon = '', -- f013
                        symbols = {
                                -- Standard unicode symbols to cycle through for LSP progress:
                                spinner = { '⠋', '⠙', '⠹', '⠸', '⠼', '⠴', '⠦', '⠧', '⠇', '⠏' },
                                -- Standard unicode symbol for when LSP is done:
                                done = '✓',
                                -- Delimiter inserted between LSP names:
                                separator = ' ',
                      },
                      -- List of LSP names to ignore (e.g., `null-ls`):
                      ignore_lsp = {},
                      -- Display the LSP name
                      show_name = false,
                    }
                  
        },
		lualine_y = { "progress" },
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
