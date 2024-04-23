-- context bar above window
return {
  'utilyre/barbecue.nvim',
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  opts = {
    theme = {
      basename = {
        bold = true,
        fg = '#f6c177',
      },
    },
  },
}
