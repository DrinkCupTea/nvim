-- ibl.lua — indent guides. The active colorscheme drives the highlight.
-- `main = "ibl"` is required because the plugin's module is at the package
-- root (lua/ibl.lua) rather than under lua/.
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {},
  main = "ibl",
}
