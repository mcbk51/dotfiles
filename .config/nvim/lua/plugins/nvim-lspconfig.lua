-- plugins/nvim-lspconfig.lua
return {
  -- Main LSP Configuration
  "neovim/nvim-lspconfig",
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    -- Mason must be loaded before its dependents so we need to set it up here.
    -- NOTE: `opts = {}` is the same as calling `require('mason').setup({})`
    { "williamboman/mason.nvim", opts = {} },
    "williamboman/mason-lspconfig.nvim",
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- Useful status updates for LSP.
    { "j-hui/fidget.nvim", opts = {} },
    -- Allows extra capabilities provided by blink.cmp
    "saghen/blink.cmp",
  },
  event = "User FilePost",
  config = function()
    require("nvchad.configs.lspconfig").defaults()
  end,
}
