-- Mason Configuration
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "bashls",
        "cssls",
        "html",
        "ts_ls",
        "jsonls",
        "remark_ls",
        "textlsp",
        "jedi_language_server",
        "rust_analyzer",
        "taplo",
        "vimls",
        "lemminx",
        "yamlls",
        "zls",
    }
})

-- Lsp's Configuration
require("lspconfig").vimls.setup({})
require("lspconfig").bashls.setup({})
require("lspconfig").cssls.setup({})
require("lspconfig").html.setup({})
require("lspconfig").ts_ls.setup({})
require("lspconfig").jsonls.setup({})
require("lspconfig").remark_ls.setup({})
require("lspconfig").textlsp.setup({})
require("lspconfig").jedi_language_server.setup({})
require("lspconfig").rust_analyzer.setup({})
require("lspconfig").taplo.setup({})
require("lspconfig").lemminx.setup({})
require("lspconfig").yamlls.setup({})
require("lspconfig").zls.setup({})

local on_attach = function(_, _)
    vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {})

    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
    vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {})
    vim.keymap.set('n', 'gk', vim.lsp.buf.hover, {})
end

require("lspconfig").lua_ls.setup({
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
        },
    },
})
