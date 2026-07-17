return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signcolumn      = true,    -- :Gitsigns toggle_signs
    numhl           = false,   -- :Gitsigns toggle_numhl
    linehl          = false,   -- :Gitsigns toggle_linehl
    word_diff       = false,   -- :Gitsigns toggle_word_diff
    watch_gitdir    = { follow_files = true },
    attach_to_untracked = true,

    current_line_blame         = false, -- :Gitsigns toggle_current_line_blame
    current_line_blame_opts    = {
      virt_text           = true,
      virt_text_pos       = 'eol',
      delay               = 1000,
      ignore_whitespace   = false,
      virt_text_priority  = 100,
    },
    current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
    sign_priority     = 6,
    update_debounce   = 100,
    status_formatter  = nil,    -- use default
    max_file_length   = 40000,  -- disable for very long files

    preview_config = {
      border   = 'single',
      style    = 'minimal',
      relative = 'cursor',
      row      = 0,
      col      = 1,
    },
  },
}
