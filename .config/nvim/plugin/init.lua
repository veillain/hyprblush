-- Plugins
vim.g.plugins = {
	-- PM
	"https://github.com/BryceVandegrift/pm",
	-- Colorschemes
    "https://github.com/Everblush/nvim",
    -- Mini Family
    "https://github.com/echasnovski/mini.bracketed",
    "https://github.com/echasnovski/mini.indentscope",
    "https://github.com/echasnovski/mini.notify",
    "https://github.com/echasnovski/mini.comment",
    "https://github.com/echasnovski/mini.move",
    "https://github.com/echasnovski/mini.splitjoin",
    "https://github.com/echasnovski/mini.icons",
    "https://github.com/echasnovski/mini.statusline",
    "https://github.com/echasnovski/mini.tabline",
    "https://github.com/echasnovski/mini.trailspace",
    "https://github.com/echasnovski/mini.surround",
    -- Telescope
    "https://github.com/nvim-telescope/telescope.nvim",
    "https://github.com/wojciech-kulik/filenav.nvim",
    -- Completions
    "https://github.com/neovim/nvim-lspconfig",
    "https://github.com/L3MON4D3/LuaSnip",
    "https://github.com/saadparwaiz1/cmp_luasnip",
    "https://github.com/hrsh7th/cmp-buffer",
    "https://github.com/hrsh7th/cmp-path",
    "https://github.com/hrsh7th/cmp-cmdline",
    "https://github.com/hrsh7th/cmp-nvim-lsp",
    "https://github.com/hrsh7th/nvim-cmp",
    -- Note Taking
    "https://github.com/epwalsh/obsidian.nvim",
    "https://github.com/nvim-lua/plenary.nvim",
	-- Others
	"https://github.com/letieu/btw.nvim",
	"https://github.com/folke/flash.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/lambdalisue/vim-suda",
    "https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/windwp/nvim-autopairs",
    "https://github.com/wurli/contextindent.nvim",
    "https://github.com/nvim-neo-tree/neo-tree.nvim",
    "https://github.com/shortcuts/no-neck-pain.nvim",
    "https://github.com/jake-stewart/multicursor.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/brenoprata10/nvim-highlight-colors",
}
vim.g.post_download_hooks = {}


-- Mini Setup
require("mini.icons").setup()
require("mini.bracketed").setup()
require("mini.indentscope").setup()
require("mini.notify").setup()
require("mini.comment").setup()
require("mini.move").setup()
require("mini.splitjoin").setup()
require("mini.tabline").setup()
require("mini.trailspace").setup()
require("mini.surround").setup()


-- Plugins Setup
require("btw").setup({ text = "I use neovim inside Arch (BTW)" })
require("flash").setup({})
require("nvim-autopairs").setup({})
require("multicursor-nvim").setup({})
require("nvim-highlight-colors").setup({})
require("telescope").setup({
    defaults = {
        file_ignore_patterns = {
            ".cache",
            ".local",
            ".android",
            ".rustup",
            ".cargo",
            ".pki",
            "node_modules"
        },
        mappings = {
            i = {
                ["<esc>"] = require("telescope.actions").close,
                ["<C-u>"] = false,
                ["<C-d>"] = require("telescope.actions").delete_buffer + require("telescope.actions").move_to_top,
                ["<C-j>"] = require("telescope.actions").move_selection_next,
                ["<C-k>"] = require("telescope.actions").move_selection_previous,
                ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
                ["<C-h>"] = require("telescope.actions.layout").cycle_layout_prev,
                ["<C-l>"] = require("telescope.actions.layout").cycle_layout_next,
            },
            n = {
                ["<C-p>"] = require("telescope.actions.layout").toggle_preview,
            }
        }
    },
    pickers = {
        find_files = {
            hidden = true,
        }
    },
})

require("filenav").setup({
    prev_file_key = "<S-h>",
    next_file_key = "<S-l>",
    max_history   = 100,
    remove_duplicates = true,
})

require("oil").setup({
    default_file_explorer = true,
    delete_to_trash = true,
    columns = { "icon" },
    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["q"] = { "actions.close", mode = "n"},
        ["h"] = { "actions.parent", mode = "n" },
        ["l"] = { "actions.select", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },
    use_default_keymaps = true,
    view_options = { show_hidden = true }
})
require("nvim-treesitter.configs").setup({
	highlight = { enable = true },
	indent = { enable = true },
	ensure_installed = {
        "rasi",
        "yuck",
		"bash",
		"lua",
		"vim",
		"css",
		"cpp",
		"html",
		"json",
		"jsonc",
		"python",
		"markdown",
		"javascript",
		"typescript",
		"markdown_inline",
	},
})


-- Colorschemes Setup
vim.cmd([[
	augroup TransparentBackground
	autocmd!
	autocmd ColorScheme * highlight Normal ctermbg=none guibg=none
	autocmd ColorScheme * highlight NonText ctermbg=none guibg=none
	augroup END
]])
vim.cmd("colorscheme everblush")


-- Note Taking Setup
require("obsidian").setup({
    workspaces = {
        {
            name = "Notes",
            path = "~/Notes",
        },
    },
})

-- Completion Setup
require("lspconfig").lua_ls.setup({
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
        },
    },
})
require("lspconfig").vimls.setup({})
