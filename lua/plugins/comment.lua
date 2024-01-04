-- add this to your lua/plugins.lua, lua/plugins/init.lua,  or the file you keep your other plugins:
return {
  'numToStr/Comment.nvim',
  lazy = false,
  opts = {
    toggler = { line = '<C-/>', block = 'gbc', },
    opleader = { line = '<C-/>', block = 'gb', },
  },
}
