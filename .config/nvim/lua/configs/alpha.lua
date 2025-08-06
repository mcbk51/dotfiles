local dashboard = require "alpha.themes.dashboard"


dashboard.section.header.val = {
  " __        __   _                            ",
  " \\ \\      / /__| | ___ ___  _ __ ___   ___  ",
  "  \\ \\ /\\ / / _ \\ |/ __/ _ \\| '_ ` _ \\ / _ \\ ",
  "   \\ V  V /  __/ | (_| (_) | | | | | |  __/ ",
  "    \\_/\\_/ \\___|_|\\___\\___/|_| |_| |_|\\___| ",
}

dashboard.section.buttons.val = {
  dashboard.button("e", "📄  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("f", "🔍  Find file", ":Telescope find_files no_ignore=true hidden=true <CR>"),
  dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles <CR>"),
  -- dashboard.button("p", "📁  Find project", ":Telescope projects <CR>"),
  dashboard.button("n", "📝  Note Index", ":VimwikiIndex<CR>"),
  dashboard.button("h", "🌀  Hyperland Config ", ":Telescope find_files cwd=~/dotfiles/.config/hypr <CR>"),
  dashboard.button("c", "⚙️  Nvim Config", ":Telescope find_files cwd=~/dotfiles/.config/nvim <CR>"),
  dashboard.button("q", "   Quit", ":qa<CR>"),
}

dashboard.config.layout = {
  { type = "padding", val = 6 },
  dashboard.section.header,
  { type = "padding", val = 10 }, -- space between header and buttons
  dashboard.section.buttons,
}
require("alpha").setup(dashboard.config)
