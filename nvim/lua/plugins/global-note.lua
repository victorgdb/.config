return {
  'backdround/global-note.nvim',
  config = function()
    local global_note = require 'global-note'

    global_note.setup {
      filename = function()
        return os.date '%Y/%m/%d' .. '.norg' -- Use .norg extension
      end,
      directory = '~/notes/journal/', -- Adjust to your Neorg journal directory
      title = "Today's Journal",
      autosave = true,
    }

    vim.keymap.set('n', '<C-n>', global_note.toggle_note, { desc = "Toggle today's journal note" })
  end,
}
