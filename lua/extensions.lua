local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")

lazy.setup({
  --
  "folke/which-key.nvim",
  "folke/neodev.nvim",
  { "folke/neoconf.nvim", cmd = "Neoconf" },

  -- UI
  require("plugins.bufferline"),
  require("plugins.gruvbox"),
  require("plugins.ibl"),
  require("plugins.lualine"),
  require("plugins.noice"),

  -- FUNCTIONAL
  require("plugins.neo-tree"),
  require("plugins.telescope"),
  require("plugins.treesitter"),
  require('plugins.gitsigns'),

  -- CODE
  require("plugins.autopair"),
  require("plugins.surround"),
  require('plugins.copilot'),

  -- LSP
  -- require("lsp"), depend on lsp-config, required in it
  -- require("lsp.debugger"),
  require("plugins.autocomplete"),
  require("plugins.lsp-config"),
  require('plugins.mason'),

})

