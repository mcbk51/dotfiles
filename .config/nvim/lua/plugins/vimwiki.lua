-- plugins/vimwiki.lua
return {
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
}
