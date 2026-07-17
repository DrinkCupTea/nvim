-- colorscheme.lua — load the colorscheme and report failures clearly.
-- `background` is set in basic.lua; do not duplicate here.

local colorscheme = "gruvbox"

local ok, err = pcall(vim.cmd.colorscheme, colorscheme)
if not ok then
  vim.notify(
    ("colorscheme %q not found: %s"):format(colorscheme, err),
    vim.log.levels.WARN
  )
end
