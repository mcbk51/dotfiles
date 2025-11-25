local harpoon = require("harpoon")
local ui = require("harpoon.ui")

harpoon:setup({
	settings = {
		save_on_toggle = true,
		sync_on_ui_close = true,
	},
})

local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
	telescope.load_extension("harpoon")
end

-- Key mappings
for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
	vim.keymap.set("n", string.format("<leader>%d", idx), function()
		harpoon:list():select(idx)
	end)
end

-- Add file
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
end)

vim.keymap.set("n", "<m-a>", function()
	harpoon:list():add()
	vim.notify("File added to Harpoon", "info", { title = "Harpoon" })
end)

vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {})
end)

vim.keymap.set("n", "<m-h>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {})
end)

-- Remove file
vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
end)
