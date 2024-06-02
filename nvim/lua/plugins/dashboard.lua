local function header() 
return {
' ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⠀⠀⠀⠀⠀⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀       ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⡏⠉⠳⢦⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⠶⠶⠤⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⣀⣀⠀⠈⠳⣤⡀⠀⠀⠀⠀⠀⠀⠀⢠⡞⠁⠐⣶⠄⢼⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣇⠀⠧⠀⠀⠸⣿⣷⡦⣄⠀⠀⠀⢠⣿⡤⠀⡇⠘⡆⠀⢻⡄⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠐⣦⣤⠀⠙⠹⣕⢼⣷⣄⣠⡿⠛⠉⠉⠒⣄⣿⠀⠘⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢧⠚⢻⣿⡷⢦⠀⢿⣼⣏⣺⠟⡇⠀⠀⢀⣶⣶⣾⠀⠀⣿⣧⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠧⡀⠸⣗⠈⠷⠘⠏⢻⠇⠀⠀⣿⠆⣤⣾⣿⡿⠃⢸⣿⣷⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡟⢲⠎⠃⠀⠀⠀⠀⠀⠀⠺⠁⢰⢿⡿⠋⠃⠠⡽⣷⡈⢻⠀ ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠋⠀⠀⠀⠀⢀⣷⡟⠃⠸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡾⠁⠀⠀⠀⠀⠀⢀⠀⠀⠀⠀⠀⠀⠘⢶⣷⣲⡛⠉⠰⠦⢄⣹⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠳⣆⠀⠀⠀⠀⣿⣷⡦⢤⣀⣰⣦⡀⠀⠓⣤⡘⣕⢤⡀⠀⢹⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣟⡏⠀⠀⠀⣼⠿⠛⠛⠉⠀⣠⡙⠫⣤⣀⠀⢱⣌⢧⠙⢦⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡟⠀⠀⠰⡟⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣄⢿⣞⢇⠀⠀⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⢀⣷⣿⣦⣠⠤⠈⠡⠬⠤⠀⠀⢄⡀⠈⢳⡿⣯⢳⡄⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣥⣄⣀⣠⣤⣿⣿⡿⠙⢃⡤⠶⠀⠀⠀⠀⠀⢠⣧⠀⠀⠁⣿⠀⢹⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣿⣿⠏⠀⠀⠀⣈⣤⠾⠗⠒⠒⠉⠉⠉⠑⠒⠠⢿⡀⠀⠀⢻⢢⡿⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠓⠲⠾⠿⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⠲⣼⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀',
'						   ',
}
end
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  config = function()
    require('dashboard').setup {
      theme = 'hyper',
      config = {
	mru = { limit = 10, cwd_only = true },
	header = header(),
        shortcut = {
          { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
          {
            icon = ' ',
            icon_hl = '@variable',
            desc = 'Files',
            group = 'Label',
            action = 'Telescope find_files',
            key = 'f',
          },
          {
            desc = ' Apps',
            group = 'DiagnosticHint',
            action = 'Telescope app',
            key = 'a',
          },
          {
            desc = ' dotfiles',
            group = 'Number',
            action = 'Telescope dotfiles',
            key = 'd',
          },
        },
      },
    }
  end,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } },
}
