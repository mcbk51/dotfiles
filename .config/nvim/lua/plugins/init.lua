return {
  {
    "stevearc/conform.nvim",
      lazy = false, 
    -- event = 'BufWritePre', -- uncomment for format on save
    
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
      lazy = false,
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
   "huytd/vim-quickrun",
    lazy = false,
    cmd = { "QuickRun" }, -- lazy loads only when you use the command
  },
  {
   "hdima/python-syntax",
   ft = { "python" }, -- loads only for Python files
   },

  { 
   "chiel92/vim-autoformat",
   lazy = false,
   cmd = { "Autoformat" }, -- lazy loads when the command is used
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,  -- <- this disables lazy loading!
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup()
    end,
  }
  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
