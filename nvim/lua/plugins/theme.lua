return {
  { 'rose-pine/neovim', name = 'rose-pine' },
  -- 'mhartington/oceanic-next',
  {
    'Shatur/neovim-ayu',
    config = function()
      require('ayu').setup {
        mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
        overrides = {}, -- A dictionary of group names, each associated with a dictionary of parameters (`bg`, `fg`, `sp` and `style`) and colors in hex.
      }
    end,
  },
}
--return { 'rmehri01/onenord.nvim' }
