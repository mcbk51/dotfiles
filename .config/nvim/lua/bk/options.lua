vim.g.mapleader = " "

local opt = vim.opt

opt.tabstop = 4
opt.softtabstop = 4
opt.expandtab = true

opt.inccommand = "split"
opt.wrap = true

opt.smartindent = true
opt.winborder = "rounded"
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = true
opt.incsearch = true

opt.smartcase = true
opt.ignorecase = true

opt.linebreak = true
opt.scrolloff = 8
opt.updatetime = 50

opt.splitbelow = true
opt.splitright = true

-- set color
opt.termguicolors = true

-- set number line
opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes" -- Keep space on the left for signs (LSP, git, etc.)

--removing ~
opt.fillchars:append({ eob = " " })

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

-- Show notification when recording starts/stops
vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local reg = vim.fn.reg_recording()
    vim.notify("Recording macro to register: " .. reg, vim.log.levels.INFO)
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.notify("Macro recording stopped", vim.log.levels.INFO)
  end,
})


