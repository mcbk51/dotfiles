-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "oxocarbon",
  --transparency = true,

  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}
M.ui = {
  statusline = {
    theme = "vscode_colored", -- also try "minimal", "vscode", etc.
    separator_style = "default", -- "default", "round", "arrow", "block", or "none"
    -- Add `overriden_modules = {}` here if you want to fully customize the content
  },
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
--}
M.polish = function()
  -- Highlight fixes for LSP semantic tokens (e.g. fmt.Errorf)
  vim.api.nvim_set_hl(0, "@lsp.type.namespace", { link = "Include" })  -- fmt
  vim.api.nvim_set_hl(0, "@lsp.type.method", { link = "Function" })    -- Errorf
end

return M
