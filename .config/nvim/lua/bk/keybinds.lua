vim.g.mapleader = " "
local map = function(mode, lhs, rhs, opts)
	-- Ensure opts is a table, even if nil is passed
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- minifiles
map("n", "<C-e>", function()
	local minifiles = require("mini.files")
	if not minifiles.close() then
		minifiles.open()
	end
end, { desc = "toggle mini.files" })

-- Other General changes
map("n", "<leader>pv", vim.cmd.Ex, {desc = "native file navigator(netrw)" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

map("n", "<leader>u", vim.cmd.UndotreeToggle, {desc = "toggle undo tree"})
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make current file executable"})

map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })
map("n", "<leader>aa", "<cmd>Alpha <CR>", { desc = "open Alpha" })
map("n", "<leader>fs", "<cmd>source %<CR>", { desc = "source current file" })
map("x", "<leader>ph", '"_dP', { desc = "conserve previous highlight" })

-- moving in insert mode
map("i", "<C-h>", "<Left>", { desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- moving between panel(defaults fine)
map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })
map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })

-- telescope
map("n", "<leader>fl", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<C-b>", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fg", "<cmd>Telescope git_files<CR>", { desc = "Find Git Files" })
map("n", "<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<C-z>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
--map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)
map("n", "<leader>fe", function()
	require("telescope").extensions.file_browser.file_browser({
		path = vim.fn.expand("%:p:h"),
		select_buffer = true,
		hidden = true,
		grouped = true,
		respect_gitignore = false,
	})
end, { desc = "telescope file browser" })

-- Buffer mappings
map("n", "<leader>b", "<cmd>enew<CR>", { desc = "buffer new" })
map("n", "<tab>", function()
	vim.cmd("bnext")
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
	vim.cmd("bprevious")
end, { desc = "buffer goto prev" })
map("n", "<leader>x", function()
	vim.cmd("bdelete")
end, { desc = "buffer close" })


-- easymotion
map("n", "<C-m>", "<Plug>(easymotion-overwin-f2)")
map("n", "<leader>ss","<Plug>(easymotion-overwin-f2)", { desc = "easymotion search 2 characters"})
map("n", "<leader>sj", "<Plug>(easymotion-j)", { desc = "easymotion jump down"})
map("n", "<leader>sk", "<Plug>(easymotion-k)", { desc = "easymotion jump up"})

-- vim test
map("n", "<leader>tt", ":TestNearest<CR>", { desc = "Test Nearest" })
map("n", "<leader>tT", ":TestFile<CR>", { desc = "Test File" })
map("n", "<leader>ts", ":TestSuite<CR>", { desc = "Test Suite" })
map("n", "<leader>tl", ":TestLast<CR>", { desc = "Test Last" })
map("n", "<leader>tv", ":TestVisit<CR>", { desc = "Test Visit" })

-- changing working directory
map("n", "<leader>cd", function()
	local path = vim.fn.expand("%:p:h")
	vim.cmd("cd " .. path)
	print("CWD set to: " .. path)
end, { desc = "Set CWD to file directory" })

-- adding lazygit
map("n", "<leader>lg", function()
	vim.cmd("split")
	vim.cmd("terminal lazygit")
	vim.cmd("startinsert")
end, { desc = "Open lazygit in new tab" })


-- Tmux-sessionizer
map("n","<C-f>","<cmd>silent !tmux neww ~/dev/scripts/tmux/tmux-sessionizer<CR>",{ desc = "terminal escape terminal mode" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
        vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

-- Move selected text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle (Half page jumping and search)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")


