local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
	"███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗",
	"████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║",
	"██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║",
	"██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║",
	"██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║",
	"╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝",
}

dashboard.section.buttons.val = {
	dashboard.button("a", "📄  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("r", "🕘  Recent files", ":Telescope oldfiles <CR>"),
	dashboard.button("f", "🔍  Find file", ":Telescope find_files no_ignore=true hidden=true <CR>"),
	-- dashboard.button("n", "📝  Note Index", ":VimwikiIndex<CR>"),
	dashboard.button("p", "🖥️  Projects", ":Telescope find_files cwd=~/dev/projects/<CR>"),
	-- dashboard.button("d", "🚀  Dev", ":Telescope find_files cwd=~/dev/<CR>"),
	dashboard.button("s", "⌨️  Scripts", ":Telescope find_files cwd=~/.local/bin/scripts/<CR>"),
	-- dashboard.button(".", "📦  Dotfiles", ":Telescope find_files cwd=~/dotfiles/.config/<CR>"),
	dashboard.button("h", "🌀  Hyprland Config", ":Telescope find_files cwd=~/dotfiles/.config/hypr <CR>"),
	-- dashboard.button("c", "⚙️  Nvim Config", ":Telescope find_files cwd=~/dotfiles/.config/nvim <CR>"),
	-- dashboard.button("e", "📁  Browser files", ":Telescope file_browser  <CR>"),
	-- dashboard.button("p", "📁  Find project", ":Telescope projects <CR>"),
	dashboard.button("q", "   Quit", ":qa<CR>"),
}

dashboard.config.layout = {
	{ type = "padding", val = 6 },
	dashboard.section.header,
	{ type = "padding", val = 10 }, -- space between header and buttons
	dashboard.section.buttons,
}
require("alpha").setup(dashboard.config)
