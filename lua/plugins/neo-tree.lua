-- close neo-tree when no window left
-- vim.cmd [[
--   au WinEnter * if (winnr("$") == 1 && &filetype == "neotree") | q | endif
-- ]]

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  opts = {
    -- neovim map
    vim.api.nvim_set_keymap("n", "<C-n>", ":Neotree toggle<CR>", {noremap = true, silent = true}),
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
}
