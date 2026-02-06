local harpoon = require("harpoon")
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

-- Function to update harpoon keymaps with current file names
local function update_harpoon_keymaps()
	for _, idx in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) do
		local item = harpoon:list():get(idx)
		local desc = item and string.format("%d: %s", idx, item.value) or string.format("%d: [empty]", idx)
		
		vim.keymap.set("n", string.format("<leader>%d", idx), function()
			harpoon:list():select(idx)
		end, { desc = desc })
	end
end

-- Initial setup
update_harpoon_keymaps()

-- Update descriptions when harpoon UI closes
vim.api.nvim_create_autocmd("User", {
	pattern = "HarpoonUIWindowClosed",
	callback = update_harpoon_keymaps,
})

-- Add file
vim.keymap.set("n", "<leader>ha", function()
	harpoon:list():add()
	update_harpoon_keymaps()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<m-a>", function()
	harpoon:list():add()
	update_harpoon_keymaps()
	vim.notify("File added to Harpoon", "info", { title = "Harpoon" })
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<leader>hh", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {})
end, { desc = "Harpoon menu" })

vim.keymap.set("n", "<m-h>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list(), {})
end, { desc = "Harpoon menu" })

-- Remove file
vim.keymap.set("n", "<leader>hr", function()
	harpoon:list():remove()
	update_harpoon_keymaps()
end, { desc = "Harpoon remove file" })
