return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('fzf-lua').setup({
      -- 全局设置
      winopts = {
        height = 0.85,
        width = 0.80,
        row = 0.35,
        col = 0.50,
        border = 'rounded',
        preview = {
          default = 'bat',
          border = 'border',
          wrap = 'nowrap',
          hidden = 'nohidden',
          vertical = 'down:45%',
          horizontal = 'right:60%',
          layout = 'flex',
          flip_columns = 120,
        },
      },
      keymap = {
        builtin = {
          -- neovim `:tmap` mappings for the fzf win
          ["<F1>"]        = "toggle-help",
          ["<F2>"]        = "toggle-fullscreen",
          -- Only valid with the 'builtin' previewer
          ["<F3>"]        = "toggle-preview-wrap",
          ["<F4>"]        = "toggle-preview",
          -- Rotate preview clockwise/counter-clockwise
          ["<F5>"]        = "toggle-preview-ccw",
          ["<F6>"]        = "toggle-preview-cw",
          ["<S-down>"]    = "preview-page-down",
          ["<S-up>"]      = "preview-page-up",
          ["<S-left>"]    = "preview-page-reset",
        },
        fzf = {
          -- fzf '--bind=' options
          ["ctrl-z"]      = "abort",
          ["ctrl-u"]      = "unix-line-discard",
          ["ctrl-f"]      = "half-page-down",
          ["ctrl-b"]      = "half-page-up",
          ["ctrl-a"]      = "beginning-of-line",
          ["ctrl-e"]      = "end-of-line",
          ["alt-a"]       = "toggle-all",
          -- Only valid with fzf previewers (bat/cat/git/etc)
          ["f3"]          = "toggle-preview-wrap",
          ["f4"]          = "toggle-preview",
          ["shift-down"]  = "preview-page-down",
          ["shift-up"]    = "preview-page-up",
        },
      },
      -- 文件查找配置
      files = {
        prompt = 'Files❯ ',
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        find_opts = [[-type f -not -path '*/\.git/*' -printf '%P\n']],
        rg_opts = "--color=never --files --hidden --follow -g '!.git'",
        fd_opts = "--color=never --type f --hidden --follow --exclude .git",
      },
      -- 实时搜索配置
      grep = {
        prompt = 'Rg❯ ',
        input_prompt = 'Grep For❯ ',
        multiprocess = true,
        git_icons = true,
        file_icons = true,
        color_icons = true,
        rg_opts = "--column --line-number --no-heading --color=always --smart-case --max-columns=512",
        grep_opts = "--binary-files=without-match --line-number --recursive --color=auto --perl-regexp",
      },
    })
  end
}