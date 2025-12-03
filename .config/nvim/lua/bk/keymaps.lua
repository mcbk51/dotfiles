local map = function(mode, lhs, rhs, opts)
	-- Ensure opts is a table, even if nil is passed
	opts = opts or {}
	vim.keymap.set(mode, lhs, rhs, opts)
end

-- General binds
map("n", "<leader>pv", vim.cmd.Ex, { desc = "native file navigator(netrw)" })
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "general clear highlights" })
map("n", "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "general copy whole file" })
map("n", "<leader>uu", function()
	require("undotree").toggle()
end, { noremap = true, silent = true, desc = "toggle undotree" })
map("n", "<leader>fx", "<cmd>!chmod +x %<CR>", { silent = true, desc = "make current file executable" })
map("n", "<leader>/", "gcc", { desc = "toggle comment", remap = true })
map("v", "<leader>/", "gc", { desc = "toggle comment", remap = true })
map("n", "<leader>aa", "<cmd>Alpha <CR>", { desc = "open Alpha" })
map("n", "<leader>fs", "<cmd>source %<CR>", { desc = "source current file" })
map("x", "<leader>ph", '"_dP', { desc = "conserve previous highlight" })
map("t", "<esc><esc>", "<C-\\><C-N>", { desc = "terminal escape terminal mode" })

map("n", "<leader>nr", function()
	if vim.opt.relativenumber:get() then
		vim.opt.relativenumber = false
	else
		vim.opt.number = true
		vim.opt.relativenumber = true
	end
end, { desc = "toggle relative number" })

-- moving in insert mode
map("i", "<C-h>", "<Left>", { remap = true, desc = "move left" })
map("i", "<C-l>", "<Right>", { desc = "move right" })
map("i", "<C-j>", "<Down>", { desc = "move down" })
map("i", "<C-k>", "<Up>", { desc = "move up" })

-- moving between panel
map("n", "<c-h>", "<c-w>h", { desc = "switch window left" })
map("n", "<c-l>", "<c-w>l", { desc = "switch window right" })
map("n", "<c-j>", "<c-w>j", { desc = "switch window down" })
map("n", "<c-k>", "<c-w>k", { desc = "switch window up" })

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("n", "<C-b>", "<cmd>Telescope buffers<CR>")
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("n", "<leader>fG", "<cmd>Telescope git_files<CR>", { desc = "Find Git Files" })
map("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("n", "<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("n", "<C-n>", "<cmd>Telescope harpoon marks<CR>", { desc = "telescope harpoon files" })
map("n", "<C-z>", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("n", "<leader>fgc", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("n", "<leader>fgt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("n", "<leader>fc", "<cmd>Telescope colorscheme enable_preview=true<cr>", { desc = "Theme picker" })
--map("n", "<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })

map(
	"n",
	"<leader>fa",
	"<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
	{ desc = "telescope find all files" }
)

map("n", "<leader>fk", function()
	require("telescope.builtin").keymaps()
end, { desc = "telescope keymaps" })

map("n", "<leader>fgl", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("n", "<leader>fgw", function()
	local word = vim.fn.expand("<cword>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "telescope(grep) word under cursor" })

map("n", "<leader>fgW", function()
	local word = vim.fn.expand("<cWORD>")
	require("telescope.builtin").grep_string({ search = word })
end, { desc = "telescope(grep) WORD under cursor" })

map("n", "<leader>fgs", function()
	require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "telescope(grep) input" })

map("n", "<leader>fe", function()
	require("telescope").extensions.file_browser.file_browser({
		path = vim.fn.expand("%:p:h"),
		select_buffer = true,
		hidden = true,
		grouped = true,
		respect_gitignore = false,
		depth = 2,
	})
end, { desc = "telescope file browser" })

map("n", "<M-e>", function()
	require("telescope").extensions.file_browser.file_browser({
		path = vim.fn.expand("%:p:h"),
		select_buffer = true,
		hidden = true,
		grouped = true,
		respect_gitignore = false,
	})
end, { desc = "telescope file browser" })

-- minifiles
map("n", "<C-e>", function()
	local minifiles = require("mini.files")
	if not minifiles.close() then
		local buf_path = vim.api.nvim_buf_get_name(0)
		if buf_path == "" then
			minifiles.open(vim.loop.cwd())
		else
			minifiles.open(buf_path)
		end
	end
end, { desc = "toggle mini.files" })

-- zen mode
map("n", "<leader>zz", function()
	require("zen-mode").setup({
		window = {
			width = 90,
			options = {},
		},
	})
	require("zen-mode").toggle()
	vim.wo.wrap = false
	vim.wo.number = false
	vim.wo.rnu = false
	vim.opt.colorcolumn = "0"
	ColorMyPencils()
end, { desc = "Toggle Zen Mode" })

map("n", "<leader>zZ", function()
	require("zen-mode").setup({
		window = {
			width = 80,
			options = {},
		},
	})
	require("zen-mode").toggle()
	vim.wo.wrap = false
	im.wo.number = false
	vim.wo.rnu = false
	vim.opt.colorcolumn = "0"
	ColorMyPencils()
end)

-- lsp
map("n", "<leader>ds", vim.diagnostic.setloclist, { desc = "LSP diagnostic loclist" })
map("n", "<leader>de", function()
	vim.diagnostic.open_float(nil, { scope = "line" })
end, { desc = "Show line diagnostics (Error/Warning)" })

map("n", "<leader>fp", function()
	require("telescope.builtin").lsp_document_symbols({
		symbols = { "function", "method", "class", "struct", "string", "int", "bool", "float" },
	})
end, { desc = "Filtere LSP symbols" })

map("n", "gd", function()
	vim.lsp.buf.definition()
end, { desc = "LSP: Go to definition" })

map("n", "K", function()
	vim.lsp.buf.hover()
end, { desc = "LSP: Hover documentation" })

map("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end, { desc = "LSP: Search workspace symbols" })

map("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end, { desc = "LSP: Code actions" })

map("n", "<leader>vfr", function()
	vim.lsp.buf.references()
end, { desc = "LSP: Find references" })

map("n", "<leader>vrn", function()
	vim.lsp.buf.rename()
end, { desc = "LSP: Rename symbol" })

map("i", "<C-g>", function()
	vim.lsp.buf.signature_help()
end, { desc = "LSP: Signature help" })

-- Buffer mappings
map("n", "<leader>bn", "<cmd>enew<CR>", { desc = "buffer new" })

map("n", "<leader>bx", function()
	vim.cmd("bdelete")
end, { desc = "buffer close" })
map("n", "<C-X>", function()
	vim.cmd("bdelete")
end, { desc = "buffer close" })
map("n", "<leader>xx", function()
	vim.cmd("bdelete")
end, { desc = "close buffer" })

map("n", "<tab>", function()
	vim.cmd("bnext")
end, { desc = "buffer goto next" })
map("n", "<S-tab>", function()
	vim.cmd("bprevious")
end, { desc = "buffer goto prev" })

-- easymotion
map("n", "<M-f>", "<Plug>(easymotion-overwin-f)", { desc = "easymotion search 1 characters" })
map("n", "<leader>ss", "<Plug>(easymotion-overwin-f2)", { desc = "easymotion search 2 characters" })
-- map("n", "<leader>sj", "<Plug>(easymotion-j)", { desc = "easymotion jump down" })
-- map("n", "<leader>sk", "<Plug>(easymotion-k)", { desc = "easymotion jump up" })

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

-- split
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split" })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split" })
map("n", "<leader>sx", "<C-w>q", { desc = "Close split" })

-- Tmux-sessionizer
map(
	"n",
	"<C-f>",
	"<cmd>silent !tmux neww ~/dev/scripts/tmux/tmux-sessionizer<CR>",
	{ desc = "terminal escape terminal mode" }
)

-- Whichkey
map("n", "<leader>wK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })
map("n", "<leader>wk", function()
	vim.cmd("WhichKey " .. vim.fn.input("WhichKey: "))
end, { desc = "whichkey query lookup" })

-- Move selected text
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Quickfix
map("n", "<leader>qf", function()
	local qf_exists = false
	for _, win in pairs(vim.fn.getwininfo()) do
		if win["quickfix"] == 1 then
			qf_exists = true
			break
		end
	end
	if qf_exists then
		vim.cmd("cclose")
	else
		vim.cmd("copen")
	end
end, { desc = "toggle quickfix" })
map("n", "<leader>qc", function()
	vim.fn.setqflist({})
end, { desc = "clear quickfix" })
map("n", "<M-j>", "<cmd>cnext<CR>")
map("n", "<M-k>", "<cmd>cprev<CR>")

-- Keep cursor in the middle (Half page jumping and search)
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")
map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
