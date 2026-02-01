return{
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for `ask()` and `select()`.
    -- Required for `snacks` provider.
    { "folke/snacks.nvim", opts = { input = { enable = true }, picker = {}, terminal = {} } },
  },
  config = function()
    vim.g.opencode_opts = {
      -- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
    }

    -- Required for `opts.events.reload`.
    vim.o.autoread = true

  end,
}
