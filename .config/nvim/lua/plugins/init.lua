-- plugins/init.lua
return {
  -- Core NvChad plugins
  require "plugins.nvchad-suite",
  -- UI and Icons
  require "plugins.nvim-web-devicons",
  require "plugins.alpha",
  require "plugins.indent-blankline",
  require "plugins.which-key",

  -- File management and navigation
  require "plugins.nvim-tree",
  require "plugins.harpoon",
  require "plugins.telescope",

  -- LSP and completion
  require "plugins.mason",
  require "plugins.nvim-lspconfig",
  require "plugins.nvim-cmp",
  require "plugins.nvim-treesitter",

  -- Formatting
  require "plugins.conform",
  require "plugins.vim-autoformat",

  -- Git
  require "plugins.gitsigns",

  -- Language-specific
  require "plugins.vim-go",
  require "plugins.render-markdown",

  -- Productivity
  require "plugins.vimwiki",

  -- Development tools
  require "plugins.vim-quickrun",
}
