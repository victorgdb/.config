return {
  'echasnovski/mini.files',
  version = '*',
  config = function()
    require('mini.files').setup(
      {
        mappings = {
          close = '<Esc>',
          go_in_plus = '<CR>',
        },
        windows = {
          -- Maximum number of windows to show side by side
          max_number = math.huge,
          -- Whether to show preview of file/directory under cursor
          preview = false,
          -- Width of focused window
          width_focus = 50,
          -- Width of non-focused window
          width_nofocus = 15,
          -- Width of preview window
          width_preview = 60,
        },
      }
    )
    vim.api.nvim_create_autocmd('User', {
      pattern = 'MiniFilesWindowOpen',
      callback = function(args)
        local win_id  = args.data.win_id

        -- Customize window-local settings
        local config  = vim.api.nvim_win_get_config(win_id)
        config.border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' }

        vim.api.nvim_win_set_config(win_id, config)
      end,
    })
  end
}
