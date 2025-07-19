-- plugins/alpha.lua
return {
  "goolord/alpha-nvim",
  config = function()
    require "configs.alpha"
  end,
  dependencies = { "nvim-tree/nvim-web-devicons" },
}
