local status_ok, bufferline = pcall(require, "bufferline")
if not status_ok then
	return
end

bufferline.setup({
	options = {
		mode = "buffers",
		numbers = "none",
		indicator = {
			icon = "▎",
			style = "icon",
		},
		buffer_close_icon = "󰅖",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		max_name_length = 18,
		max_prefix_length = 15,
		truncate_names = true,
		tab_size = 18,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level)
			local icon = level:match("error") and " " or " "
			return " " .. icon .. count
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
				separator = true,
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = true,
		show_tab_indicators = true,
		show_duplicate_prefix = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = false,
		always_show_bufferline = false,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "insert_after_current",
	},
	highlights = {
		-- Main backgrounds
		fill = {
			bg = "NONE",
			guibg = "NONE",
		},
		background = {
			bg = "NONE",
			guibg = "NONE",
		},
		buffer_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		buffer_selected = {
			bg = "NONE",
			guibg = "NONE",
			bold = true,
			italic = false,
		},

		-- Separators
		separator = {
			bg = "NONE",
			guibg = "NONE",
		},
		separator_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		separator_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Tabs
		tab = {
			bg = "NONE",
			guibg = "NONE",
		},
		tab_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		tab_close = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Close buttons
		close_button = {
			bg = "NONE",
			guibg = "NONE",
		},
		close_button_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		close_button_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Modified indicators
		modified = {
			bg = "NONE",
			guibg = "NONE",
		},
		modified_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		modified_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Duplicate indicators
		duplicate = {
			bg = "NONE",
			guibg = "NONE",
		},
		duplicate_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		duplicate_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Indicators
		indicator_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		indicator_visible = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Diagnostics
		error = {
			bg = "NONE",
			guibg = "NONE",
		},
		error_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		error_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		error_diagnostic = {
			bg = "NONE",
			guibg = "NONE",
		},
		error_diagnostic_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		error_diagnostic_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		warning = {
			bg = "NONE",
			guibg = "NONE",
		},
		warning_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		warning_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		warning_diagnostic = {
			bg = "NONE",
			guibg = "NONE",
		},
		warning_diagnostic_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		warning_diagnostic_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		info = {
			bg = "NONE",
			guibg = "NONE",
		},
		info_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		info_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		info_diagnostic = {
			bg = "NONE",
			guibg = "NONE",
		},
		info_diagnostic_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		info_diagnostic_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		hint = {
			bg = "NONE",
			guibg = "NONE",
		},
		hint_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		hint_selected = {
			bg = "NONE",
			guibg = "NONE",
		},
		hint_diagnostic = {
			bg = "NONE",
			guibg = "NONE",
		},
		hint_diagnostic_visible = {
			bg = "NONE",
			guibg = "NONE",
		},
		hint_diagnostic_selected = {
			bg = "NONE",
			guibg = "NONE",
		},

		-- Offset section (for NvimTree)
		offset_separator = {
			bg = "NONE",
			guibg = "NONE",
		},
	},
})
