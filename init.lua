-- init.lua — entry point
-- Each require is wrapped so a broken module won't kill the rest of init;
-- :messages keeps the original error visible for debugging.

local function safe_require(mod)
  local ok, err = pcall(require, mod)
  if not ok then
    vim.schedule(function()
      vim.notify(("require(%q) failed: %s"):format(mod, err), vim.log.levels.ERROR)
    end)
  end
end

safe_require('basic')
safe_require('keymaps')
safe_require('autocmds')
safe_require('extensions')
safe_require('colorscheme')
