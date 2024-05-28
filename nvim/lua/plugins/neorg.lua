return {
  {
    'vhyrro/luarocks.nvim',
    priority = 1000,
    config = true,
  },
  {
    'nvim-neorg/neorg',
    dependencies = { 'luarocks.nvim' },
    version = '*',
    config = function()
      require('neorg').setup {
        load = {
          ['core.defaults'] = {},
          ['core.qol.todo_items'] = {},
          ['core.itero'] = {},
          ['core.completion'] = {
            config = {
              engine = 'nvim-cmp',
            },
          },
          ['core.concealer'] = {},
          ['core.keybinds'] = {
            config = {
              hook = function(keybinds)
                keybinds.remap_event('norg', 'n', '<C-y>', 'core.qol.todo_items.todo.task_cycle')
              end,
            },
          },
          ['core.dirman'] = {
            config = {
              workspaces = {
                notes = '~/notes',
              },
              default_workspace = 'notes',
            },
          },
        },
      }
    end,
  },
}
