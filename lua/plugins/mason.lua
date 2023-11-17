local needInstall = {
  -- lsp
  'clangd',
  'cmake-language-server',
  'gopls',
  'lua-language-server',
  'rust-analyzer',
  'shellcheck',
  'vim-language-server',
  -- dap
  'codelldb',
  'go-debug-adapter',
  -- formatter
  'clang-format',
}

local M = {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end,
    dependencies = {
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      opts = function ()
        require('mason-tool-installer').setup {
          ensure_installed = needInstall,
          auto_update = false,
         run_on_start = true,
          start_delay = 3000, -- 3 second delay
          debounce_hours = 5, -- at least 5 hours between attempts to install/update
        }
      end
    }
  }
}

return M

