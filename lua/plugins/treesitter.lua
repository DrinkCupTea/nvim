-- treesitter.lua — language parsers + highlights.
-- `build = ":TSUpdate"` is the legacy nvim-treesitter install hook; lazy.nvim
-- runs `:TSUpdate` once on install/update with it. To upgrade to the modern
-- (Neovim 0.11+) vim.treesitter-native config, follow:
--   https://github.com/nvim-treesitter/nvim-treesitter#readme
return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "c", "cpp", "go", "html", "javascript",
        "lua", "python", "query", "rust", "vim", "vimdoc",
      },
      sync_install = false,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection     = "<CR>",
          node_incremental   = "<CR>",
          node_decremental   = "<BS>",
          scope_incremental  = "<TAB>",
        },
      },
    })
  end,
}
