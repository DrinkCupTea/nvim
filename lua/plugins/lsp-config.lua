-- lsp-config.lua — LSP keymaps (buffer-local) and per-server configuration.
-- Backed by Neovim's built-in vim.lsp.config / vim.lsp.enable (0.11+).
-- See :help lspconfig-nvim-0.11

-- Global diagnostic mappings (no buffer-local scoping needed).
local keymap = vim.keymap.set
keymap('n', '<space>e', vim.diagnostic.open_float,    { desc = 'Diagnostic: open float' })
keymap('n', '[d',       vim.diagnostic.goto_prev,     { desc = 'Diagnostic: prev' })
keymap('n', ']d',       vim.diagnostic.goto_next,     { desc = 'Diagnostic: next' })
keymap('n', '<space>q', vim.diagnostic.setloclist,    { desc = 'Diagnostic: loclist' })

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

-- Per-server configuration. Each entry becomes the `settings` payload that
-- the server receives in the `initialize` request.
local servers = {
  lua_ls = {
    settings = {
      Lua = {
        runtime = { version = 'LuaJIT' },
        diagnostics = { globals = { 'vim' } },
        workspace   = { library = vim.api.nvim_get_runtime_file('', true) },
        telemetry   = { enable  = false },
      },
    },
  },
  clangd       = {},
  pyright      = {},
  gopls        = {},
  rust_analyzer = {},
  cmake        = {},
  vimls        = {},
}

for name, cfg in pairs(servers) do
  vim.lsp.config(name, cfg)
end

vim.lsp.enable(vim.tbl_keys(servers), true)

-- This file is a side-effect-only module for the LSP setup; lazy.nvim needs
-- a table to register, so we hand it back an empty spec.
return {}
