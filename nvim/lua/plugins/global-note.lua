return {
  'backdround/global-note.nvim',
  config = function()
    local global_note = require 'global-note'

    global_note.setup {
      filename = 'todo.norg',
      directory = '~/notes/', -- Adjust to your Neorg journal directory
      title = "Todo",
      autosave = true,
    }

    vim.keymap.set('n', '<C-n>', global_note.toggle_note, { desc = "Toggle today's journal note" })
  end,
}
