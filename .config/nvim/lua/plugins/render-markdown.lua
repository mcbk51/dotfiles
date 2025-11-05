-- plugins/render-markdown.lua
return {
  "MeanderingProgrammer/markdown.nvim",
  lazy = true,
  name = "render-markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  config = function()
    require("render-markdown").setup(require "configs.render-markdown")
  end,
}
