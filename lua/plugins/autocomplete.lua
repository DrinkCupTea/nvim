-- autocomplete.lua — blink.cmp.
--
-- Replaces hrsh7th/nvim-cmp + LuaSnip + all cmp-* sources that the previous
-- spec pulled in. blink has built-in LSP, snippet, buffer, path handling;
-- no extra source plugins are needed. Snippets use blink's native engine
-- (no LuaSnip dependency). The friendly-snippets collection is no longer
-- required either — register snippet files under a 'snippets' source if
-- desired.
--
-- See https://github.com/saghen/blink.cmp for the current options.
return {
  'saghen/blink.cmp',
  version = '1.*',     -- pin to the 1.x major; 0.x is pre-release
  event = 'InsertEnter',
  opts = {
    -- Default keymap ("default" preset is Enter/Shift-Tab accept, C-y to
    -- pick first item, C-e to abort). Override only what's different.
    keymap = {
      ['<C-b>'] = { 'scroll_documentation_up',   'fallback' },
      ['<C-f>'] = { 'scroll_documentation_down', 'fallback' },
      ['<C-j>'] = { 'select_next',  'fallback' },
      ['<C-k>'] = { 'select_prev',  'fallback' },
      -- Accept the current item, do not auto-show if popup hidden.
      ['<CR>']  = { 'accept', 'fallback' },
      ['<Tab>'] = { 'select_next', 'fallback' },
    },
    sources = {
      'lsp',       -- LSP completion
      'path',      -- file paths
      'snippets',  -- blink's native snippet engine
      'buffer',    -- words from other buffers
    },
    -- Use blink's native snippet support; no LuaSnip needed.
    snippets = { preset = 'default' },
    -- A subtle visual style: smaller popup and bordered docs window.
    appearance = {
      use_bordered = true,
    },
    completion = {
      list = {
        selection_order = 'topmost',
      },
    },
  },
}
