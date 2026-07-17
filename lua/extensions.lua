-- extensions.lua — lazy.nvim bootstrap & plugin registration.
-- All plugin specs live under lua/plugins/ and are grouped below by purpose.

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- UI
  require("plugins.bufferline"),
  require("plugins.gruvbox"),
  require("plugins.ibl"),
  require("plugins.lualine"),

  -- FUNCTIONAL
  require("plugins.neo-tree"),
  require("plugins.fzf-lua"),
  require("plugins.treesitter"),
  require("plugins.gitsigns"),

  -- CODE
  require("plugins.autopair"),
  require("plugins.surround"),
  require("plugins.comment"),

  -- LSP: see lua/plugins/lsp-config.lua
  require("plugins.autocomplete"),
  require("plugins.lsp-config"),

  -- keybinding hints — empty spec kept intentionally; populate via keys in
  -- plugins/which-key.lua when ready.
  require("plugins.which-key"),
})
