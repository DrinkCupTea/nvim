return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
  config = function()
    require("bufferline").setup({
      options = {
        -- :Bdelete provided by moll/vim-bbye.
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",

        -- Reserve left space for neo-tree when open.
        offsets = {
          {
            filetype    = "neo-tree",
            text        = "File Explorer",
            highlight   = "Directory",
            text_align  = "left",
          },
        },

        diagnostics          = "nvim_lsp",
        diagnostics_indicator = function(_, _, diagnostics_dict)
          local s = " "
          for level, n in pairs(diagnostics_dict) do
            local sym = level == "error" and "✗"
                     or level == "warning" and "!"
                     or "·"
            s = s .. n .. sym
          end
          return s
        end,
      },
    })
  end,
}
