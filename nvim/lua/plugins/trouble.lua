return {
  "folke/trouble.nvim",
  keys = {
    {
      "<D-d>",
      "<cmd>Trouble diagnostics toggle<cr>",
      desc = "Diagnostics (Trouble)",
    }
  },
  dependencies = { "nvim-tree/nvim-web-devicons" },

  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
}
