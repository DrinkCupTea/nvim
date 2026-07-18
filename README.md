# nvim

Personal Neovim config — Neovim 0.12.4 + [lazy.nvim](https://github.com/folke/lazy.nvim).
Targets Lua-language projects (heavy use of `lua_ls`, `treesitter-lua`).

## Layout

```
init.lua                  safe_require wrapper for each module below
lua/
  basic.lua               editor options (scrolloff, listchars, splits, ...)
  keymaps.lua             user keymaps (leader/window/scotch-tape)
  autocmds.lua            misc autocmd groups (yank highlight, neo-tree)
  colorscheme.lua         gruvbox loader
  extensions.lua          lazy bootstrap + plugin registration
  plugins/                13 plugin specs, one file each
```

## Plugins

| Plugin            | Purpose               | Trigger         |
|-------------------|-----------------------|-----------------|
| gruvbox           | colorscheme           | eager (1000)    |
| bufferline + bbye | tab UI                | VeryLazy        |
| lualine           | statusline            | VeryLazy        |
| ibl               | indent guides         | VeryLazy        |
| neo-tree          | file tree (`<C-n>`)   | keys            |
| fzf-lua           | fuzzy finder          | keys (`<C-p>`)  |
| nvim-treesitter   | syntax (2.x on main)  | VeryLazy        |
| gitsigns          | git signs + blame     | lazy            |
| blink.cmp         | completion            | InsertEnter     |
| LSP (vim.lsp)     | lua_ls/clangd/...     | LspAttach       |
| autopair          | auto-brackets         | VeryLazy        |
| nvim-surround     | `ys`/`cs`/`ds`        | VeryLazy        |
| Comment.nvim      | `gcc`/`gc`            | VeryLazy        |
| which-key         | keymap hints          | lazy            |

## Keymap conventions

- Leader = space. `<space>t` / `<space>vt` open terminal.
- `s` is reserved as a single-stroke window prefix (not a motion):
  `sl` v-split, `sd` h-split, `sc` close, `so` close-others,
  `sj/sk` resize, `s,/s.` resize, `s=` equalize.
- `<C-hjkl>` window nav; `<C-arrow>` resize.
- `<M-h>/<M-l>` cycle buffers; `<C-w>` close-buffer-keep-window.
- `<space>e` diagnostic float, `[d`/`]d` prev/next diagnostic,
  `<space>q` diagnostic loclist.
- LSP buffers: `gd`/`gD` def/decl, `K` hover, `gi` impl, `gr` refs,
  `<C-k>` sig, `<space>D` type-def, `<space>rn` rename,
  `<space>f` format, `<space>ca` code action, `<space>ih` toggle inlay hints.

## LSP & Treesitter

- LSP via built-in `vim.lsp.config / vim.lsp.enable` (0.11+).
  Servers: `lua_ls clangd pyright gopls rust_analyzer cmake vimls`.
- Treesitter via `nvim-treesitter` 2.x on `main`, parsers installed for
  c/cpp/go/html/javascript/lua/python/query/rust/vim/vimdoc; attached
  per-buffer by a `FileType` autocmd that calls `vim.treesitter.start`.

## Common commands

```vim
:Lazy update            " update all plugins
:Lazy log               " recent versions per plugin
:TSUpdate / :TSInstall  " treesitter parsers (needs `tree-sitter` CLI)
:LspInfo / :LspRestart
:checkhealth nvim-treesitter blink.cmp
```

```bash
brew upgrade neovim tree-sitter-cli   # toolchain
```