return {
  "folke/noice.nvim",
  event = "VeryLazy",
  opts = {
    lsp = {
      progress = { enabled = true }, -- show LSP progress messages
      hover = { enabled = true }, -- custom hover window
      signature = { enabled = true }, -- custom signature help
      message = { enabled = true }, -- show LSP messages
    },
    presets = {
      bottom_search = true, -- position search bar at the bottom
      command_palette = true, -- align cmdline and popupmenu together
      long_message_to_split = true, -- send long messages to a split window
      inc_rename = false, -- integrate with inc-rename.nvim
      lsp_doc_border = true, -- add border to hover/signature windows
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup", -- "cmdline" (bottom) or "cmdline_popup" (floating)
      format = {
        cmdline = { icon = "" },
        search_down = { icon = "⌄" },
        search_up = { icon = "⌃" },
      },
    },
    messages = {
      enabled = true,
      view = "mini", -- could be "mini", "notify", or "popup"
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    views = {
      cmdline_popup = {
        position = {
          row = "50%",
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
      popupmenu = {
        relative = "editor",
        anchor = "top_right",
        position = {
          row = 1,
          col = "100%",
        },
        size = {
          width = 40,
          height = 5,
        },
        border = {
          style = "rounded",
        },
        win_options = {
          winblend = 20,
          zindex = 100,
        },
      },
    },
  },
  dependencies = {
	  "MunifTanjim/nui.nvim",
	  {
		  "rcarriga/nvim-notify",
		  opts ={
			  background_colour = "#000000",
		  },
	  },
  }
}
