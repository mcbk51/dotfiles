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
  dashboard.button("f", "🔍  Find file", ":Telescope find_files <CR>"),
  dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles <CR>"),
  dashboard.button("p", "📁  Find project", ":Telescope projects <CR>"),
  dashboard.button("c", "⚙️  Config", ":Telescope find_files cwd=~/.config/nvim <CR>"),
}

dashboard.config.layout = {
  { type = "padding", val = 6 },
  dashboard.section.header,
  { type = "padding", val = 16 }, -- space between header and buttons
  dashboard.section.buttons,
}
require("alpha").setup(dashboard.config)
