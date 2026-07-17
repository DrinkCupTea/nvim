-- treesitter.lua — nvim-treesitter (modern config, Neovim 0.11+).
--
-- The legacy `require('nvim-treesitter.configs').setup({...})` API was
-- replaced by the two-step pattern: install parsers, then start with the
-- integration options. `vim.treesitter` is now built into Neovim and the
-- `vim.treesitter.start` call is the canonical way to enable highlight /
-- indent / incremental selection features.
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",                 -- 2.x lives on main; master is legacy
  build  = ":TSUpdate",
  event  = "VeryLazy",
  config = function()
    -- Step 1: ensure the listed parsers are compiled.
    require("nvim-treesitter").install({
      "c", "cpp", "go", "html", "javascript",
      "lua", "python", "query", "rust", "vim", "vimdoc",
    })

    -- Step 2: enable TS-based features. `:h vim.treesitter.start`
    vim.treesitter.start({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection    = "<CR>",
          node_incremental  = "<CR>",
          node_decremental  = "<BS>",
          scope_incremental = "<TAB>",
        },
      },
    })
  end,
}
