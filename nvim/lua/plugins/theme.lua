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
        on_highlight = function(highlights, palette)
          highlights.TelescopeSelection = {
            fg = '#88C0D0',
            bg = palette.gray2,
          }
          highlights.NeoTreeCursorLine = {
            fg = '#88C0D0',
            bg = palette.gray2,
          }
          highlights.TelescopeSelectionCaret = {
            fg = '#88C0D0',
            bg = palette.gray2,
          }
          highlights.NormalFloat = {
            bg = palette.bg_float,
          }
          highlights.PmenuSel = {
            bg = palette.gray2,
          }
          highlights.Pmenu = {
            bg = palette.bg_float
          }
          highlights.Visual = {
            bg = palette.gray2,
          }
          highlights.MiniFilesNormal = {
            bg = palette.bg_float,
          }
          highlights.MiniFilesCursorLine = {
            bg = palette.gray2,
          }
          highlights.MiniFilesBorder = {
            bg = palette.bg_float,
            fg = palette.black0,
          }
          highlights.MiniFilesTitle = {
            bg = palette.black1,
          }
          highlights.MiniFilesTitleFocused = {
            bg = palette.black1,
            fg = '#E7C173'
          }
          highlights.GrappleNormal = {
            bg = palette.black1,
            fg = palette.white0,
          }
          highlights.GrappleFloat = {
            bg = palette.black1,
            fg = palette.white0,
          }
          highlights.GrappleBorder = {
            bg = palette.black1,
            fg = palette.black0,
          }
          highlights.GrappleTitle = {
            bg = palette.black1,
            fg = '#E7C173'
          }
          highlights.GrappleFooter = {
            bg = palette.black1,
            fg = '#E7C173'
          }
          highlights.GrappleFloat = {
            bg = palette.black1,
            fg = palette.black1,
          }
        end,
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
