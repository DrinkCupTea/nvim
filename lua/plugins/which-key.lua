-- which-key.lua — pop up a hint window while you type leader sequences.
-- The basic `s*` (windows) and `<leader>t` (terminal) groups are registered
-- here so users actually feel which-key. Add more groups as you add maps.
return {
  "folke/which-key.nvim",
  config = function()
    require("which-key").setup({
      spec = {
        { "<leader>b", group = "buffer"    },
        { "<leader>t", group = "terminal"  },
        { "<leader>v", group = "terminal (vertical)" },
        { "s",         group = "window"    },
      },
    })
  end,
}
