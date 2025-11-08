-- plugins/nvim-treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  lazy = false,
  config = function()
    require("configs.nvim-treesitter")
  end,
}
