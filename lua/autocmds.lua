-- autocmds.lua — autocommand groups that don't belong with a plugin spec.
local group = vim.api.nvim_create_augroup('UserAutocmds', { clear = true })

-- Close neo-tree automatically when it is the only window left.
vim.api.nvim_create_autocmd('WinEnter', {
  group    = group,
  callback = function()
    if vim.fn.winnr('$') == 1 and vim.bo.filetype == 'neo-tree' then
      vim.cmd('quit')
    end
  end,
})

-- Highlight on yank: clear the search register after a short delay.
vim.api.nvim_create_autocmd('TextYankPost', {
  group    = group,
  desc     = 'Briefly highlight yanked text',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 200 }
  end,
})
