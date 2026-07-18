-- treesitter.lua — modern nvim-treesitter (2.x on `main`) + Neovim builtin.
--
-- The 2.x rewrite split the old `highlight / indent / incremental_selection`
-- modules out of this plugin. The current responsibilities are:
--   - `install(...)` — compile a parser from a grammar repo
--   - `setup()` — only accepts `{ install_dir = ... }`
-- Highlighting, indenting, and parsing are now driven by Neovim's built-in
-- `vim.treesitter.start(bufnr, lang)`, called on each FileType event.
--
-- If you later want text-objects/incremental-selection, install
--   `nvim-treesitter/nvim-treesitter-textobjects`
-- alongside this plugin.

return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  build  = ":TSUpdate",
  event  = "VeryLazy",
  config = function()
    -- 1. Compile/install the parsers we care about.
    require("nvim-treesitter").install({
      "c", "cpp", "go", "html", "javascript",
      "lua", "python", "query", "rust", "vim", "vimdoc",
    })

    -- 2. Attach the parser to every buffer that has a known filetype.
    --    `vim.treesitter.start` enables parsing + built-in syntax highlighting
    --    in one call (`opts` is omitted intentionally — the defaults suffice).
    vim.api.nvim_create_autocmd("FileType", {
      group    = vim.api.nvim_create_augroup("TreesitterStart", { clear = true }),
      callback = function(ev)
        local lang = ev.match
        if not lang or lang == "" then return end
        pcall(vim.treesitter.language.add, lang)
        pcall(vim.treesitter.start, ev.buf, lang)
      end,
    })
  end,
}
