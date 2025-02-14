-- Basic Settings
vim.opt.title = true
vim.opt.relativenumber = true
vim.opt.hidden = true
vim.opt.mouse = "a"
vim.schedule(function()
	vim.opt.clipboard = "unnamedplus"
end)
vim.opt.laststatus = 2
vim.opt.hlsearch = true
vim.opt.termguicolors = true
vim.g.have_nerd_font = true

-- Indentation Settings
vim.opt.smarttab = true
vim.opt.autoindent = true
vim.opt.cindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
-- always use space instead of tab chars.
vim.opt.expandtab = true
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.textwidth = 0
vim.opt.autochdir = true

vim.opt_local.conceallevel = 2
