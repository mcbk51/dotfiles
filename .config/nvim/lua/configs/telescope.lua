return {
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = " ",
		sorting_strategy = "ascending",
		layout_config = {
			horizontal = {
				prompt_position = "top",
				preview_width = 0.55,
			},
			width = 0.87,
			height = 0.80,
		},
		mappings = {
			n = { ["q"] = require("telescope.actions").close },
		},
	},
	-- Add this to enable the `project` extension
	extensions_list = { "themes", "terms", "project" },

	extensions = {
		project = {
			base_dirs = {
				{ path = "~/dev/projects", max_depth = 2 },
			},
			hidden_files = false,
			theme = "dropdown",
			order_by = "recent",
			search_by = "title",
			sync_with_nvim_tree = false,
		},
	},
}
