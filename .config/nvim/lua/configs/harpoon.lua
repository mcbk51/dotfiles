local harpoon = require("harpoon")
local ui = require("harpoon.ui")

-- Setup Harpoon v2
harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})

-- Telescope extension
local telescope_ok, telescope = pcall(require, "telescope")
if telescope_ok then
    telescope.load_extension("harpoon")
end

-- Key mappings for selecting harpoon files
for _, idx in ipairs({ 1, 2, 3, 4, 5 }) do
    vim.keymap.set("n", string.format("<leader>%d", idx), function()
        harpoon:list():select(idx)
    end, { desc = "Harpoon to file " .. idx })
end

-- Add file
vim.keymap.set("n", "<leader>ha", function()
    harpoon:list():add()
end, { desc = "Harpoon add file" })

vim.keymap.set("n", "<m-a>", function()
    harpoon:list():add()
    vim.notify("File added to Harpoon", "info", { title = "Harpoon" })
end, { desc = "Harpoon add file" })

-- Toggle quick menu (FIXED)
vim.keymap.set("n", "<leader>hh", function()
    ui.toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

vim.keymap.set("n", "<m-h>", function()
    ui.toggle_quick_menu(harpoon:list())
end, { desc = "Harpoon quick menu" })

-- Remove current file
vim.keymap.set("n", "<leader>hr", function()
    harpoon:list():remove()
end, { desc = "Harpoon remove file" })

