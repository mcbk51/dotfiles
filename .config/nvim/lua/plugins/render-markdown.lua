-- plugins/render-markdown.lua
return {
  "MeanderingProgrammer/markdown.nvim",
  lazy = true,
  name = "render-markdown",
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  ft = { "markdown" },
  config = function()
    local render_markdown = require "render-markdown"
    render_markdown.setup(require "configs.render-markdown")

    -- Auto-toggle rendering based on mode
    vim.api.nvim_create_autocmd("InsertEnter", {
      pattern = "*.md",
      callback = function()
        render_markdown.disable()
      end,
    })

    vim.api.nvim_create_autocmd("InsertLeave", {
      pattern = "*.md",
      callback = function()
        render_markdown.enable()
      end,
    })
  end,
}
