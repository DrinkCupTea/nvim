-- lsp-config.lua — LSP keymaps (buffer-local) and per-server configuration.
-- Backed by Neovim's built-in vim.lsp.config / vim.lsp.enable (0.11+).
-- See :help lspconfig-nvim-0.11

-- Global diagnostic mappings (no buffer-local scoping needed).
local keymap = vim.keymap.set
keymap('n', '<space>e', vim.diagnostic.open_float,    { desc = 'Diagnostic: open float' })
keymap('n', '[d',       vim.diagnostic.goto_prev,     { desc = 'Diagnostic: prev' })
keymap('n', ']d',       vim.diagnostic.goto_next,     { desc = 'Diagnostic: next' })
keymap('n', '<space>q', vim.diagnostic.setloclist,    { desc = 'Diagnostic: loclist' })

-- Inlay hints: enabled globally for every LSP-attached buffer.
-- `<space>ih` toggles per buffer via the buffer-local `is_enabled` check
-- (Neovim 0.11+). When the buffer has no LSP client, the toggle still
-- works — `enable(not is_enabled(...))` is a no-op against an empty
-- client list and just flips the per-buffer state for whenever a client
-- later attaches.
vim.lsp.inlay_hint.enable(true)
keymap('n', '<space>ih', function()
  vim.lsp.inlay_hint.enable(
    not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }),
    { bufnr = 0 }
  )
end, { desc = 'LSP: toggle inlay hints' })

-- Buffer-local mappings applied on LspAttach.
vim.api.nvim_create_autocmd('LspAttach', {
  group    = vim.api.nvim_create_augroup('UserLspConfig', { clear = true }),
  callback = function(ev)
    -- <c-x><c-o> still works as a fallback completion trigger.
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf, desc = 'LSP' }
    keymap('n', 'gD',    vim.lsp.buf.declaration,           opts)
    keymap('n', 'gd',    vim.lsp.buf.definition,            opts)
    keymap('n', 'K',     vim.lsp.buf.hover,                 opts)
    keymap('n', 'gi',    vim.lsp.buf.implementation,        opts)
    keymap('n', '<C-k>', vim.lsp.buf.signature_help,        opts)
    keymap('n', '<space>D',  vim.lsp.buf.type_definition,   opts)
    keymap('n', '<space>rn', vim.lsp.buf.rename,            opts)
    keymap('n', '<space>f', function() vim.lsp.buf.format { async = true } end, opts)
    keymap({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    keymap('n', 'gr',    vim.lsp.buf.references,            opts)
  end,
})

-- Per-server configuration, grouped by language family. Each entry becomes
-- the `settings` payload the server receives in the `initialize` request.
-- See :help vim.lsp.config for fields like `filetypes`, `root_dir`, `cmd`.
local servers = {
  -- Nvim runtime tooling.
  lua_ls = {
    settings = {
      Lua = {
        runtime     = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace   = { library = vim.api.nvim_get_runtime_file('', true) },
        telemetry   = { enable  = false },
      },
    },
  },
  vimls = {},

  -- Systems languages.
  clangd        = {},
  gopls         = {},
  rust_analyzer = {},

  -- Other.
  pyright = {},
  cmake   = {},
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, cfg)
end
-- The `settings` set above are merged in via `vim.tbl_deep_extend('force')`.
-- Plugin-provided `lsp/<name>.lua` configs win for any keys we don't set;
-- to truly override those, drop a file at `after/lsp/<name>.lua`.
vim.lsp.enable(vim.tbl_keys(servers))

-- This file is a side-effect-only module for the LSP setup; lazy.nvim needs
-- a table to register, so we hand it back an empty spec.
return {}
