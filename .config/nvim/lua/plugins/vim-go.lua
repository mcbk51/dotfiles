-- plugins/vim-go.lua
return {
  "fatih/vim-go",
  build = ":GoUpdateBinaries",
  ft = { "go" }, -- optional: load only for Go files
  init = function()
    vim.g.go_fmt_command = "goimports"
    vim.g.go_autodetect_gopath = 1
    vim.g.go_def_mode = "gopls"
    vim.g.go_info_mode = "gopls"
  end,
}
