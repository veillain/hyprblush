---- Remaps ----
vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("n", "<leader>/", "<Cmd>noh<CR>")
-- Buffers
vim.keymap.set("n", "gb", "<cmd>bnext<cr>")
vim.keymap.set("n", "gB", "<cmd>bprev<cr>")
vim.keymap.set("n", "<leader>bb", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bB", "<Cmd>bprev<CR>")
vim.keymap.set("n", "<leader>bn", "<Cmd>bnext<CR>")
vim.keymap.set("n", "<leader>bN", "<Cmd>bprev<CR>")
-- Windows
vim.keymap.set("n", "gw", "<C-w>w")
vim.keymap.set("n", "gW", "<C-w>W")
vim.keymap.set("n", "<leader>ww", "<C-w>w")
vim.keymap.set("n", "<leader>wW", "<C-w>W")
vim.keymap.set("n", "<leader>wn", "<C-w>w")
vim.keymap.set("n", "<leader>wN", "<C-w>W")
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
