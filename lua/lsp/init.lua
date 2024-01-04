require('lsp.config.lua')
require('lsp.config.clangd')
require('lsp.config.pyright')

require('lspconfig').gopls.setup({})
require('lspconfig').rust_analyzer.setup({})
require('lspconfig').cmake.setup({})

