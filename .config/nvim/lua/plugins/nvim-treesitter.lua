-- plugins/nvim-treesitter.lua
return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  lazy = false,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
