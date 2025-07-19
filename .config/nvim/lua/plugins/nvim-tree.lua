-- plugins/nvim-tree.lua
return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  lazy = false,
  opts = function()
    return require "nvchad.configs.nvimtree"
  end,
}
