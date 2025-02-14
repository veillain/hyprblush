-- Completion Setup
local luasnip = require'luasnip'
local cmp = require'cmp'
cmp.setup({
snippet = {
  expand = function(args)
    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
    vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
  end,
},

formatting = {
    format = require("nvim-highlight-colors").format
},

window = {
  completion = cmp.config.window.bordered(),
  documentation = cmp.config.window.bordered(),
},

sources = cmp.config.sources({
  { name = 'nvim_lsp' },
  { name = 'luasnip' },
  { name = 'path' },
  { name = 'buffer' },
  { name = 'render-markdown' },
}),

mapping = cmp.mapping.preset.insert({
  ['<C-b>'] = cmp.mapping.scroll_docs(-4),
  ['<C-f>'] = cmp.mapping.scroll_docs(4),
  ['<C-Space>'] = cmp.mapping.complete(),
  ['<C-e>'] = cmp.mapping.confirm({ select = false }),
  -- ['<CR>'] = cmp.mapping.close(),
  ["<Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_next_item()
  elseif luasnip.locally_jumpable(1) then
    luasnip.jump(1)
  else
    fallback()
  end
end, { "i", "s" }),

["<S-Tab>"] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item()
  elseif luasnip.locally_jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end, { "i", "s" }),
}),
})

cmp.setup.cmdline({ '/', '?' }, {
mapping = cmp.mapping.preset.cmdline(),
sources = {
  { name = 'buffer' }
}
})

cmp.setup.cmdline(':', {
mapping = cmp.mapping.preset.cmdline(),
sources = cmp.config.sources({
  { name = 'path' }
}, {
  { name = 'cmdline' }
}),
matching = { disallow_symbol_nonprefix_matching = false }
})

local capabilities = require('cmp_nvim_lsp').default_capabilities()
