return {
  'victorgdb/vim-dadbod-ui',
  dependencies = {
    { 'tpope/vim-dadbod', lazy = true },
    { 'victorgdb/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql', 'dbout' }, lazy = true },
  },
  cmd = {
    'DBUI',
    'DBUIToggle',
    'DBUIAddConnection',
    'DBUIFindBuffer',
    'DBCompletionClearCache',
  },
  init = function()
    -- Your DBUI configuration
    vim.g.db_ui_use_nerd_fonts = 1
    vim.g.db_adapter_bigquery_dataset = 'kaya'
  end,
}
