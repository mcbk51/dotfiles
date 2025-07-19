-- plugins/mason.lua
return {
  "williamboman/mason.nvim",
  cmd = { "Mason", "MasonInstall", "MasonUpdate" },
  opts = function()
    return require "nvchad.configs.mason"
  end,
}
