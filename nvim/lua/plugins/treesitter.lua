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
        'norg',
        'markdown',
        'markdown_inline',
        'python',
        'toml',
        'latex',
        'html',
        'json',
        'sql',
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
