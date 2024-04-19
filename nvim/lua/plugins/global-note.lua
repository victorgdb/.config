return {
  'backdround/global-note.nvim',
  config = function()
    local global_note = require 'global-note'
    global_note.setup()

    vim.keymap.set('n', '<c-n>', global_note.toggle_note, {
      desc = 'Toggle global note',
    })
  end,
}
