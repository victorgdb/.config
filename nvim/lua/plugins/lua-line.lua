return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            function()
              local is_loaded = vim.api.nvim_buf_is_loaded
              local tbl = vim.api.nvim_list_bufs()
              local loaded_bufs = 0
              for i = 1, #tbl do
                if is_loaded(tbl[i]) then
                  loaded_bufs = loaded_bufs + 1
                end
              end
              return loaded_bufs
            end,
            icon = '﬘',
          },
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      extensions = { 'nvim-tree' },
    }
  end,
}
