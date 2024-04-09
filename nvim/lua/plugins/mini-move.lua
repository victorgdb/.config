return {
  'echasnovski/mini.move',
  version = '*',
  config = function()
    require('mini.move').setup {
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
        left = 'Ì',
        right = '¬',
        down = 'Ï',
        up = 'È',

        -- Move current line in Normal mode
        line_left = 'Ì',
        line_right = '¬',
        line_down = 'Ï',
        line_up = 'È',
      },

      -- Options which control moving behavior
      options = {
        -- Automatically reindent selection during linewise vertical move
        reindent_linewise = true,
      },
    }
  end,
}
