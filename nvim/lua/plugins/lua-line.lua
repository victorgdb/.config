return {
  'nvim-lualine/lualine.nvim',
  config = function(_, opts)
    require('lualine').setup { sections = { lualine_c = { 'harpoon2' } } }
  end,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
}
