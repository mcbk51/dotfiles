local harpoon = require("harpoon")

-- Setup harpoon with settings
harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

-- Load telescope extension if telescope is available
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
	telescope.load_extension("harpoon")
end

-- Export the open_harpoon_file function for use in keymaps
local M = {}

M.open_harpoon_file = function(n)
	local ok, err = pcall(function()
		local file = harpoon:list():get(n)
		if file then
			vim.cmd("edit " .. vim.fn.fnameescape(file.value))
		else
			vim.notify("No Harpoon file at index " .. n, vim.log.levels.WARN)
		end
	end)
	if not ok then
		vim.notify("Failed to open Harpoon file " .. n .. ": " .. err, vim.log.levels.ERROR)
	end
end

return M
