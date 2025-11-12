vim.g.mapleader = " "
local map = function(mode, lhs, rhs, opts)
	-- Ensure opts is a table, even if nil is passed
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

--Vim native file system navigator
map("n", "<leader>pv", vim.cmd.Ex)

-- nvimtree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- Other General changes
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })

map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })

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


--telescope
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
map("n", "<leader>fa", "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",{ desc = "telescope find all files" })
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

--chmod
map("n", "<leader>cx", "<cmd>!chmod +x %<CR>", { silent = true })

-- easymotion
map("n", "<leader><Leader>s", "<Plug>(easymotion-overwin-f2)", {})
map("n", "<C-m>", "<Plug>(easymotion-overwin-f2)", {})
map("n", "<leader><leader>j", "<Plug>(easymotion-j)", {})
map("n", "<leader><leader>k", "<Plug>(easymotion-k)", {})

-- vim test
map("n", "<leader>t", ":TestNearest<CR>")
map("n", "<leader>T", ":TestFile<CR>")
map("n", "<leader>a", ":TestSuite<CR>")
map("n", "<leader>ll", ":TestLast<CR>")
map("n", "<leader>lg", ":TestVisit<CR>")

-- changing working directory
map("n", "<leader>cd", function()
	local path = vim.fn.expand("%:p:h")
	vim.cmd("cd " .. path)
	print("CWD set to: " .. path)
end, { desc = "Set CWD to file directory" })

-- adding lazygit
map("n", "<leader>gg", function()
	vim.cmd("split")
	vim.cmd("terminal lazygit")
	vim.cmd("startinsert")
end, { desc = "Open lazygit in new tab" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })

-- Tmux-sessionizer
map("n", "<C-f>","<cmd>silent !tmux neww ~/dev/scripts/tmux/tmux-sessionizer<CR>",{ desc = "terminal escape terminal mode" })

-- terminal
map("t", "<C-x>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

-- Alpha
map("n", "<C-h>", "<cmd>Alpha <CR>", { desc = "open Alpha" })

-- source file
map("n", "<leader>cf", "<cmd>source %<CR>", { desc = "Execute the current file" })

-- Move selected text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Keep cursor in the middle (Half page jumping and search)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

-- Conserve the previous highlight
map("x", "<leader>ph", '"_dP', { desc = "conserve previous highlight" })

-- whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

-- undotree
map("n", "<leader>u", vim.cmd.UndotreeToggle)

-- global lsp mappings
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
