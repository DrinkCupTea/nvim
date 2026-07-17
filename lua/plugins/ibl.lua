-- ibl.lua — indent guides. Let the active colorscheme drive the highlight
-- (the previous "rainbow" block created highlight groups that were never
-- wired to the indent renderer — see plan §1.5).
return {
  "lukas-reineke/indent-blankline.nvim",
  event = "VeryLazy",
  opts = {},
  config = function()
    require("ibl").setup({})
  end,
  main = "ibl",
}
