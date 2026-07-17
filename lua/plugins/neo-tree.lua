-- neo-tree.lua — file explorer.
-- `keys = { ... }` registers <C-n> only after the plugin loads (lazy.nvim
-- will install the mapping at setup time).
return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim",
  },
  keys = {
    { "<C-n>", "<cmd>Neotree toggle<CR>", mode = { "n" }, desc = "Neo-tree: toggle" },
  },
}
