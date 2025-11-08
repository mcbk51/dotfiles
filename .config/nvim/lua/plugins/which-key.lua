-- plugins/which-key.lua
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  cmd = "WhichKey",
  keys = {
    { "<leader>", desc = "Leader Key" },
    { "<c-w>", desc = "Window" },
    { "\"", desc = "Registers" },
    { "'", desc = "Marks" },
    { "`", desc = "Marks" },
    { "c", mode = { "n", "v" }, desc = "Change" },
    { "v", mode = { "n" }, desc = "Visual" },
    { "g", mode = { "n", "v" }, desc = "Goto" },
  },
  opts = {
    plugins = {
      spelling = true,
      presets = {
        operators = false,
        motions = false,
        text_objects = false,
        windows = true,
        nav = true,
        z = true,
        g = true,
      },
    },
    win = {
      border = "rounded",
    },
    layout = {
      align = "center",
    },
  },
}

