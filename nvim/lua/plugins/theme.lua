return {
  { 'rose-pine/neovim',        name = 'rose-pine' },
  -- 'mhartington/oceanic-next',
  { 'EdenEast/nightfox.nvim' },
  { 'mhartington/oceanic-next' },
  { 'lewpoly/sherbet.nvim' },
  { 'savq/melange-nvim' },
  {
    'sho-87/kanagawa-paper.nvim',
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
      require('catppuccin').setup {
        flavour = 'frappe',
        integrations = {
          aerial = true,
          neotree = true,
          neotest = true,
          noice = true,
          telescope = true,
        },
      }
    end,
  },
  {
    'AlexvZyl/nordic.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      local palette = require 'nordic.colors'
      require('nordic').setup {
        noice = {
          -- Available styles: `classic`, `flat`.
          style = 'classic',
        },
        telescope = {
          -- Available styles: `classic`, `flat`.
          style = 'flat',
        },
        ts_context = {
          -- Enables dark background for treesitter-context window
          dark_background = true,
        },
        override = {
          TelescopeSelection = {
            fg = '#88C0D0',
            bg = palette.gray2,
          },
          NeoTreeCursorLine = {
            fg = '#88C0D0',
            bg = palette.gray2,
          },
          TelescopeSelectionCaret = {
            fg = '#88C0D0',
            bg = palette.gray2,
          },
          NormalFloat = {
            bg = palette.bg_float,
          },
          PmenuSel = {
            bg = palette.gray2,
          },
          Pmenu = {
            bg = palette.bg_float
          },
          Visual = {
            bg = palette.gray2,
          },
          MiniFilesNormal = {
            bg = palette.bg_float,
          },
          MiniFilesCursorLine = {
            bg = palette.gray2,
          },
          MiniFilesBorder = {
            bg = palette.bg_float,
            fg = palette.black0,
          },
        },
      }
    end,
  },
  { 'rebelot/kanagawa.nvim' },
  { 'sainnhe/everforest' },
  {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup {
        mirage = true,  -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      }
    end,
  },
}
--return { 'rmehri01/onenord.nvim' }
