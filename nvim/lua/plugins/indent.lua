return {
  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      require('ibl').setup {
        exclude = {
          filetypes = { 'NvimTree', 'TelescopePrompt', 'TelescopeResults', 'dashboard', 'lsp-status', 'lsp-ui' },
        },
      }
    end,
  },
}
