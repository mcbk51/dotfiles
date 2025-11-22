vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true

vim.opt.inccommand = "split"
vim.opt.wrap = true

vim.opt.smartindent = true
vim.opt.winborder = "rounded"
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.updatetime = 50

-- set color
vim.opt.termguicolors = true

-- set number line
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes" -- Keep space on the left for signs (LSP, git, etc.)
-- vim.opt.numberwidth = 3 -- Width of the number column

--removing ~
vim.opt.fillchars:append({ eob = " " })

-- Disable broken plugin queries
vim.g.matchparen_timeout = 20
vim.g.matchparen_insert_timeout = 20


vim.api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) texg",
        group = vim.api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
        callback = function()
                vim.highlight.on_yank()
        end,
})
-- vim.opt.runtimepath:remove(vim.fn.stdpath("data") .. "/lazy/nvim-colo")
