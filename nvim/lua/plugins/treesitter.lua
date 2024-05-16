return {
  'nvim-treesitter/nvim-treesitter', -- syntax highlighting and general language understanding facilities
  run = ':TSUpdate',
  config = function()
    require('nvim-treesitter.configs').setup {
      ensure_installed = {
        'vim',
        'lua',
        'sql',
        'rust',
        'regex',
        'typescript',
        'tsx',
        'javascript',
        'scss',
        'yaml',
        'python',
        'toml',
        'latex',
        'html',
        'json',
        'http',
        'graphql',
        'fish',
        'dockerfile',
        'bash',
        'css',
        'c',
      },
      highlight = {
        enable = true,
      },
    }
  end,
}
