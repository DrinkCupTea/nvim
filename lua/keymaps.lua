-- keymaps.lua — user keymaps.
-- Leader keys: ` ` (space). Both leader and local leader are space for now;
-- introduce `,` (or similar) for `localleader` later when an LSP-local set
-- needs to diverge (see `:help maplocalleader`).
--
-- `s` is reserved as a single-stroke "split/window" prefix (see below).
-- Insert-mode `<C-b>` in cmp (autocomplete.lua) is intentional — cmp only
-- consumes it when its popup is visible.

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

-- Movement -----------------------------------------------------------------
map("n", "H", "^", opt)
map("n", "L", "$", opt)
map("v", "H", "^", opt)
map("v", "L", "$", opt)
map("n", "dH", "d^", opt)
map("n", "dL", "d$", opt)
map("n", "m", "%", opt)        -- match paren / bracket under cursor
map("v", "m", "%", opt)

-- `s` reserved as the window-prefix (sl/sd/sc/so, s,/s./sj/sk, s=).
map("n", "s", "", opt)

-- Windows: split / close / navigate / resize (all under `s*` and <C-hjkl>). --
map("n", "sl", ":vsp<CR>", opt)           -- vertical split
map("n", "sd", ":sp<CR>",  opt)           -- horizontal split
map("n", "sc", "<C-w>c",  opt)            -- close current
map("n", "so", "<C-w>o",  opt)            -- close others
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-Left>",  ":vertical resize -2<CR>",  opt)
map("n", "<C-Right>", ":vertical resize +2<CR>",  opt)
map("n", "<C-Down>",  ":resize +2<CR>",   opt)
map("n", "<C-Up>",    ":resize -2<CR>",   opt)
map("n", "s,", ":vertical resize -20<CR>", opt)
map("n", "s.", ":vertical resize +20<CR>", opt)
map("n", "sj", ":resize +10<CR>",         opt)
map("n", "sk", ":resize -10<CR>",         opt)
map("n", "s=", "<C-w>=",                  opt)

-- Terminal -----------------------------------------------------------------
map("n", "<leader>t",  ":sp  | terminal<CR>", opt)
map("n", "<leader>vt", ":vsp | terminal<CR>", opt)
map("t", "<Esc>",   ":q<CR>", opt)                         -- exit term mode easily
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)

-- Visual -------------------------------------------------------------------
map("v", "<", "<gv", opt)             -- keep selection after indent
map("v", ">", ">gv", opt)
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- Scroll -------------------------------------------------------------------
map("n", "<M-j>", "6j", opt)
map("n", "<M-k>", "6k", opt)

-- Extensions ---------------------------------------------------------------
-- Bufferline / bbye
map("n", "<M-h>",   ":BufferLineCyclePrev<CR>",   opt)
map("n", "<M-l>",   ":BufferLineCycleNext<CR>",   opt)
map("n", "<C-w>",   ":Bdelete!<CR>",              opt)  -- close buffer, keep split
map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
map("n", "<leader>bh", ":BufferLineCloseLeft<CR>",  opt)
map("n", "<leader>bc", ":BufferLinePickClose<CR>",  opt)

-- fzf-lua
map("n", "<C-p>",     ":FzfLua files<CR>",      opt)
map("n", "<C-M-F>",   ":FzfLua live_grep<CR>",  opt)

-- Insert-mode helper: jump out and append.
map("i", "<C-b>", "<ESC>cwa", opt)
