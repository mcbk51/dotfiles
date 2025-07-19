-- plugins/nvchad.lua
return {
  -- Core NvChad UI with all dependencies
  {
    "nvchad/ui",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvzone/volt",
      {
        "nvchad/base46",
        build = function()
          require("base46").load_all_highlights()
        end,
      },
    },
    config = function()
      require "nvchad"
    end,
  },

  -- NvZone utilities (depend on volt)
  {
    "nvzone/menu",
    dependencies = { "nvzone/volt" },
  },

  {
    "nvzone/minty",
    dependencies = { "nvzone/volt" },
    cmd = { "Huefy", "Shades" },
  },
}
