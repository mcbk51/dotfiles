vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
  end,
})

-- Apply immediately as well
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })

-- set color
vim.opt.termguicolors = true

-- set number line
vim.opt.number = true          -- Show absolute line numbers
vim.opt.relativenumber = true  -- Show relative line numbers
vim.opt.signcolumn = "yes"     -- Keep space on the left for signs (LSP, git, etc.)
vim.opt.numberwidth = 4        -- Width of the number column


vim.g.matchparen_timeout = 20
vim.g.matchparen_insert_timeout = 20

-- clipboard
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = { "wl-copy", "--foreground", "--type", "text/plain" },
    ["*"] = { "wl-copy", "--foreground", "--type", "text/plain" },
  },
  paste = {
    ["+"] = { "wl-paste", "--no-newline" },
    ["*"] = { "wl-paste", "--no-newline" },
  },
  cache_enabled = 0,
}
vim.opt.clipboard = "unnamedplus"

--removing ~
vim.opt.fillchars:append({ eob = " " })
