-- gruvbox.lua — load gruvbox before any UI plugin so highlights are available.
return {
  "ellisonleao/gruvbox.nvim",
  priority = 1000,
  config = true,
}
