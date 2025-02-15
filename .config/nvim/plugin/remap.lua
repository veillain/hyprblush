---- Remaps ----
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>/", "<Cmd>noh<CR>")
-- Buffers
vim.keymap.set("n", "gb", "<cmd>bnext<cr>")
vim.keymap.set("n", "gB", "<cmd>bprev<cr>")
vim.keymap.set("n", "<S-j>", "<cmd>bp<cr>")
vim.keymap.set("n", "<S-k>", "<cmd>bn<cr>")
vim.keymap.set("n", "<leader>gb", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<leader>gB", "<Cmd>bprev<CR>")
-- Windows
vim.keymap.set("n", "gw", "<C-w>w")
vim.keymap.set("n", "gW", "<C-w>W")
vim.keymap.set("n", "<leader>gw", "<C-w>w")
vim.keymap.set("n", "<leader>gW", "<C-w>W")
-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope Find Files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope Live Grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope Help" })
-- Floaterminal
vim.keymap.set({ "n", "t" }, "<leader>tt", "<Cmd>Floaterminal<CR>")
-- Neotree
vim.keymap.set("n", "<leader>nt", "<Cmd>Neotree toggle<CR>")
-- Oil
vim.keymap.set("n", "-", "<Cmd>Oil --float<CR>", { buffer = 0})
vim.keymap.set("n", "<leader>oo", "<Cmd>Oil --float<CR>", { buffer = 0})
-- Mini.Indentscope
vim.keymap.set("o", "o", function()
    local operator = vim.v.operator
    if operator == "d" then
        local scope = MiniIndentscope.get_scope()
        local top = scope.border.top
        local bottom = scope.border.bottom
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        local move = ""
        if row == bottom then
            move = "k"
        elseif row == top then
            move = "j"
        end
        local ns = vim.api.nvim_create_namespace("border")
        vim.api.nvim_buf_add_highlight(0, ns, "Substitute", top - 1, 0, -1)
        vim.api.nvim_buf_add_highlight(0, ns, "Substitute", bottom - 1, 0, -1)
        vim.defer_fn(function()
            vim.api.nvim_buf_set_text(0, top - 1, 0, top - 1, -1, {})
            vim.api.nvim_buf_set_text(0, bottom - 1, 0, bottom - 1, -1, {})
            vim.api.nvim_buf_clear_namespace(0, ns, 0, -1)
        end, 150)
        return "<esc>" .. move
    else
        return "o"
    end
end, { expr = true })
