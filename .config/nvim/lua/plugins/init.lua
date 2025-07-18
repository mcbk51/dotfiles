return {
  "nvim-lua/plenary.nvim",

  {
    "nvchad/base46",
    build = function()
      require("base46").load_all_highlights()
    end,
  },

  {
    "nvchad/ui",
    lazy = false,
    config = function()
      require "nvchad"
    end,
  },

  "nvzone/volt",
  "nvzone/menu",
  { "nvzone/minty", cmd = { "Huefy", "Shades" } },

  {
    "nvim-tree/nvim-web-devicons",
    opts = function()
      dofile(vim.g.base46_cache .. "devicons")
      return { override = require "nvchad.icons.devicons" }
    end,
  },
  -- my changes
  {
    "goolord/alpha-nvim",
    config = function()
      require "configs.alpha"
    end,
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
  -- note taking
  {
    "vimwiki/vimwiki",
    init = function()
      vim.g.vimwiki_list = {
        {
          path = "~/Nextcloud/Notes",
          syntax = "markdown",
          ext = ".md",
        },
      }
      vim.g.vimwiki_global_ext = 0
    end,
    event = "VeryLazy",
  },
  {
    "fatih/vim-go",
    build = ":GoUpdateBinaries",
    ft = { "go" }, -- optional: load only for Go files
    init = function()
      vim.g.go_fmt_command = "goimports"
      vim.g.go_autodetect_gopath = 1
      vim.g.go_def_mode = "gopls"
      vim.g.go_info_mode = "gopls"
    end,
  },
  -- harpoon
  {
    "ThePrimeagen/harpoon",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("harpoon").setup()
      require("telescope").load_extension "harpoon"
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    event = "User FilePost",
    opts = {
      indent = { char = "│", highlight = "IblChar" },
      scope = { char = "│", highlight = "IblScopeChar" },
    },
    config = function(_, opts)
      dofile(vim.g.base46_cache .. "blankline")

      local hooks = require "ibl.hooks"
      hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
      require("ibl").setup(opts)

      dofile(vim.g.base46_cache .. "blankline")
    end,
  },

  -- file managing , picker etc
  {
    "nvim-tree/nvim-tree.lua",
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    lazy = false,
    opts = function()
      return require "nvchad.configs.nvimtree"
    end,
  },

  {
    "folke/which-key.nvim",
    keys = { "<leader>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    opts = function()
      dofile(vim.g.base46_cache .. "whichkey")
      return {}
    end,
  },

  -- formatting!
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format { async = true, lsp_format = "fallback" }
        end,
        mode = "",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        -- Disable "format_on_save lsp_fallback" for languages that don't
        -- have a well standardized coding style. You can add additional
        -- languages here or re-enable it for the disabled ones.
        local disable_filetypes = { c = true, cpp = true }
        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
            lsp_format = "fallback",
          }
        end
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        -- Conform can also run multiple formatters sequentially
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  -- git stuff
  {
    "lewis6991/gitsigns.nvim",
    event = "User FilePost",
    opts = function()
      return require "nvchad.configs.gitsigns"
    end,
  },

  --  -- lsp stuff
  {
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
    --{
    --    "williamboman/mason.nvim",
    --    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    --    opts = function()
    --      return require "nvchad.configs.mason"
    --    end,
    --  },
    --
    --  {
    --    "neovim/nvim-lspconfig",
    --    event = "User FilePost",
    --    config = function()
    --      require("nvchad.configs.lspconfig").defaults()
    --    end,
    --  },
    --
    -- load luasnips + cmp related in insert mode only
    {
      "hrsh7th/nvim-cmp",
      event = "InsertEnter",
      dependencies = {
        {
          -- snippet plugin
          "L3MON4D3/LuaSnip",
          dependencies = "rafamadriz/friendly-snippets",
          opts = { history = true, updateevents = "TextChanged,TextChangedI" },
          config = function(_, opts)
            require("luasnip").config.set_config(opts)
            require "nvchad.configs.luasnip"
          end,
        },

        -- autopairing of (){}[] etc
        {
          "windwp/nvim-autopairs",
          opts = {
            fast_wrap = {},
            disable_filetype = { "TelescopePrompt", "vim" },
          },
          config = function(_, opts)
            require("nvim-autopairs").setup(opts)

            -- setup cmp for autopairs
            local cmp_autopairs = require "nvim-autopairs.completion.cmp"
            require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
          end,
        },

        -- cmp sources plugins
        {
          "saadparwaiz1/cmp_luasnip",
          "hrsh7th/cmp-nvim-lua",
          "hrsh7th/cmp-nvim-lsp",
          "hrsh7th/cmp-buffer",
          "hrsh7th/cmp-path",
        },
      },
      opts = function()
        return require "nvchad.configs.cmp"
      end,
    },
    -- markdown changes
    {
      "MeanderingProgrammer/markdown.nvim",
      name = "render-markdown",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      ft = { "markdown" },
      config = function()
        require("render-markdown").setup(require "configs.render-markdown")
      end,
    },
    -- telescope
    {
      "nvim-telescope/telescope.nvim",
      dependencies = { "nvim-treesitter/nvim-treesitter" },
      lazy = false,
      cmd = "Telescope",
      opts = function()
        return require "nvchad.configs.telescope"
      end,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
      config = function()
        require("telescope").load_extension "file_browser"
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      event = { "BufReadPost", "BufNewFile" },
      cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
      build = ":TSUpdate",
      lazy = false,
      opts = function()
        return require "nvchad.configs.treesitter"
      end,
      config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
      end,
    },
  },
}
