return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    require("lualine").setup({
      options = {
        theme = "auto",
        component_separators = { left = "|", right = "|" },
        -- https://github.com/ryanoasis/powerline-extra-symbols
        section_separators   = { left = " ", right = "" },
      },
      extensions = { "neo-tree" },
      sections = {
        lualine_c = {
          "filename",
        },
        lualine_x = {
          "filesize",
          {
            "fileformat",
            symbols = { unix = "LF", dos = "CRLF", mac = "CR" },
          },
          "encoding",
          "filetype",
        },
      },
    })
  end,
}
