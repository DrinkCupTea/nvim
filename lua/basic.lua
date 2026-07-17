-- basic.lua — editor options
-- Encoding & display -------------------------------------------------------
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'utf-8'

-- Keep 6 lines visible around the cursor when scrolling with j/k/h/l.
vim.opt.scrolloff = 6
vim.opt.sidescrolloff = 6

-- Line numbers: absolute + relative (relative makes j/k counts useful).
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- Reserve a signcolumn for gitsigns/neo-tree etc; mark long lines at col 80.
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

-- Indentation --------------------------------------------------------------
local tabsize = 2
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.shiftround = true
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true

-- Search -------------------------------------------------------------------
vim.opt.ignorecase = true   -- case-insensitive by default
vim.opt.smartcase = true    -- unless an uppercase is present
vim.opt.hlsearch = true     -- highlight matches
vim.opt.incsearch = true    -- incremental search

-- UX -----------------------------------------------------------------------
vim.opt.cmdheight = 2        -- a tall cmdline for messages & completions
vim.opt.autoread = true      -- pick up external file changes
vim.opt.wrap = true          -- soft-wrap long lines
vim.o.whichwrap = '<,>,[,]'  -- allow <Left>/<Right> to skip line breaks
vim.opt.hidden = true        -- keep modified buffers in bg when switching
vim.opt.mouse = "a"          -- enable mouse in all modes
vim.opt.updatetime = 300     -- faster CursorHold for completion/AI suggestions
vim.opt.timeoutlen = 350     -- wait 350ms for key-sequence completions

-- Splits open bottom and right so terminal/files stay in expected quadrants.
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Completion / messages ----------------------------------------------------
vim.g.completeopt = "menu,menuone,noselect,noinsert"
vim.opt.wildmenu = true
vim.opt.shortmess:append('c')  -- suppress ins-completion menu messages
vim.opt.pumheight = 10         -- max 10 rows in the popup menu
vim.opt.showtabline = 2        -- always show tabline (bufferline)
vim.opt.showmode = false       -- lualine replaces the mode indicator

-- No file clutter ----------------------------------------------------------
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Colors & invisible chars -------------------------------------------------
vim.o.background = "dark"      -- synced with colorscheme.lua
vim.opt.termguicolors = true
vim.opt.list = true
vim.opt.listchars = { space = '·', tab = '▸ ' }  -- requires termguicolors
