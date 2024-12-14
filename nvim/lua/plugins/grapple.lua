return {
  'cbochs/grapple.nvim',
  opts = {
    scope = 'git_branch', -- also try out "git_branch"
    style = 'basename',
    win_opts = {
      -- Can be fractional
      row = 0.5,
      col = 0.5,

      relative = "editor",
      border = { '🭽', '▔', '🭾', '▕', '🭿', '▁', '🭼', '▏' },
      focusable = false,
      style = "minimal",

      title = "Grapple",  -- fallback title for Grapple windows
      title_pos = "center",
      title_padding = "", -- custom: adds padding around window title

      -- footer = "", -- disable footer
      footer_pos = "center",
    },
  },
  keys = {
    { '<D-a>', '<cmd>Grapple toggle<cr>',           desc = 'Tag a file' },
    { '<D-e>', '<cmd>Grapple toggle_tags<cr>',      desc = 'Toggle tags menu' },
    { '<D-@>', '<cmd>Telescope grapple tags<cr>',   desc = 'Telescope to grapple tags' },
    { '<D-&>', '<cmd>Grapple select index=1<cr>',   desc = 'Select first tag' },
    { '<D-é>', '<cmd>Grapple select index=2<cr>',   desc = 'Select second tag' },
    { '<D-">', '<cmd>Grapple select index=3<cr>',   desc = 'Select third tag' },
    { "<D-'>", '<cmd>Grapple select index=4<cr>',   desc = 'Select fourth tag' },
    { '<D-(>', '<cmd>Grapple select index=5<cr>',   desc = 'Select fifth tag' },
    { '<D-§>', '<cmd>Grapple select index=6<cr>',   desc = 'Select sixth tag' },
    { '<D-è>', '<cmd>Grapple select index=7<cr>',   desc = 'Select seventh tag' },
    { '<D-!',  '<cmd>Grapple select index=8<cr>',   desc = 'Select eighth tag' },
    { '<D-ç>', '<cmd>Grapple select index=9<cr>',   desc = 'Select ninth tag' },
    { '<D-à>', '<cmd>Grapple select index=10<cr>',  desc = 'Select tenth tag' },
    { '<D-l>', '<cmd>Grapple cycle_tags next <cr>', desc = 'Cycle to next tag' },
    { '<D-h>', '<cmd>Grapple cycle_tags prev <cr>', desc = 'Cycle to previous tag' },
  },
}
