local harpoon = require("harpoon")
local ui = require("harpoon.ui")

-- Setup harpoon with settings from file 1
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

-- Safe file opening function from file 2
local function open_harpoon_file(n)
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

-- Key mappings from file 2
vim.keymap.set("n", "<leader>1", function()
	open_harpoon_file(1)
end, { desc = "Harpoon to file 1" })

vim.keymap.set("n", "<leader>2", function()
	open_harpoon_file(2)
end, { desc = "Harpoon to file 2" })

vim.keymap.set("n", "<leader>3", function()
	open_harpoon_file(3)
end, { desc = "Harpoon to file 3" })

vim.keymap.set("n", "<leader>4", function()
	open_harpoon_file(4)
end, { desc = "Harpoon to file 4" })

vim.keymap.set("n", "<leader>5", function()
	open_harpoon_file(5)
end, { desc = "Harpoon to file 5" })

-- Additional harpoon keybinds
-- Add file
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<m-a>", function()
	harpoon:list():add()
	vim.notify("File added to harpoon", "info", { title = "Harpoon" })
end, { desc = "Harpoon add file" })
--
-- Toggle quick menu
vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

-- Remove current file
vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end, { desc = "Harpoon remove file" })
