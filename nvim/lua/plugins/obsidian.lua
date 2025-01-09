return {
  'epwalsh/obsidian.nvim',
  version = '*', -- recommended, use latest release instead of latest commit
  ft = 'markdown',
  -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
  -- event = {
  --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
  --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
  --   "BufReadPre path/to/my-vault/**.md",
  --   "BufNewFile path/to/my-vault/**.md",
  -- },

  cmd = {
    'ObsidianQuickSwitch',
    'ObsidianToday',
    'ObsidianNew',
    'ObsidianSearch',
    'ObsidianDailies',
    'ObsidianWorkspace',
    'ObsidianFollowLink',
  },
  dependencies = {
    -- Required.
    'nvim-lua/plenary.nvim',

    -- see below for full list of optional dependencies 👇
  },
  opts = {
    workspaces = {
      {
        name = 'personal',
        path = '~/Documents/MyVault',
      },
      {
        name = 'carbonfact',
        path = '~/Documents/MyVault/carbonfact',
      },
    },
    completion = {
      -- Set to false to disable completion.
      -- Trigger completion at 2 chars.
      min_chars = 2,
    },
    daily_notes = {
      -- Optional, if you keep daily notes in a separate directory.
      folder = "dailies",
      date_format = "%d %b %Y",
      alias_format = "%B %-d, %Y",
      default_tags = { "daily-notes" },
      -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
      template = nil
    },
  },
}
