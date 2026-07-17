-- autocomplete.lua — nvim-cmp + LuaSnip.
--
-- NOTE: nvim-cmp is in maintenance mode — see plan §3.1 for the
-- recommended migration to saghen/blink.cmp.
return {
  'hrsh7th/nvim-cmp',
  event = "InsertEnter",
  dependencies = {
    { 'L3MON4D3/LuaSnip', dependencies = { 'rafamadriz/friendly-snippets' } },
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-calc',
    'hrsh7th/cmp-cmdline',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-nvim-lua',
    'hrsh7th/cmp-path',
  },
  opts = function()
    local cmp = require('cmp')
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
      window = {
        completion   = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-b>']     = cmp.mapping.scroll_docs(-4),
        ['<C-f>']     = cmp.mapping.scroll_docs(4),
        ['<C-j>']     = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
        ['<C-k>']     = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>']     = cmp.mapping.abort(),
        ['<CR>']      = cmp.mapping.confirm {
            select   = true,
            behavior = cmp.ConfirmBehavior.Replace,
          },
        ['<TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item { behavior = cmp.SelectBehavior.Insert }
          else
            fallback()
          end
        end, { 'i' }),
        ['<S-TAB>'] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item { behavior = cmp.SelectBehavior.Insert }
          else
            fallback()
          end
        end, { 'i' }),
      }),
      sources = cmp.config.sources(
        {
          { name = 'nvim_lsp' },
          { name = 'buffer'   },
        },
        {
          { name = 'luasnip', option = { show_autosnippets = true } },
          { name = 'path' },
          { name = 'nvim_lua' },
          { name = 'calc' },
        }
      ),
    })
  end,
}
