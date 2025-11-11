-- plugins/render-markdown.lua
return {
 'MeanderingProgrammer/render-markdown.nvim',
  lazy = true,
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown", "vimwiki" },
  opt = function()
    require ("configs.render-markdown")
end
}
