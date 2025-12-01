require("bk.options")
require("bk.keymaps")
require("bk.clipboard")
require("bk.lazy")
-- require("bk.themes")

local api = vim.api
api.nvim_create_autocmd("TextYankPost", {
        desc = "Highlight when yanking (copying) texg",
        group = api.nvim_create_augroup("kickstart-highlight-yank", {clear = true}),
        callback = function()
                vim.highlight.on_yank()
        end,
})

-- Show notification when recording starts/stops
api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    local reg = vim.fn.reg_recording()
    vim.notify("Recording macro to register: " .. reg, vim.log.levels.INFO)
  end,
})

api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.notify("Macro recording stopped", vim.log.levels.INFO)
  end,
})



-- local augroup = vim.api.nvim_create_augroup
-- local BkGroup = augroup('BK', {})
--
-- local autocmd = vim.api.nvim_create_autocmd
--
-- autocmd('LspAttach', {
--     group = BkGroup,
--     callback = function(e)
--     --     local opts = { buffer = e.buf }
--     --     -- vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
--     --     -- vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
--     --     -- vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
--     --     -- vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
--     --     -- vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
--     --     -- vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
--     --     -- vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
--     --     -- vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
--     --     -- vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
--     --     -- vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
--     end
-- })
