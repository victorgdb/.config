return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
        -- the default case_mode is "smart_case"
      },
    },
    config = function()
      local telescopeConfig = require 'telescope.config'

      -- Clone the default Telescope configuration
      local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

      -- I want to search in hidden/dot files.
      table.insert(vimgrep_arguments, '--hidden')
      -- I don't want to search in the `.git` directory.
      table.insert(vimgrep_arguments, '--glob')
      table.insert(vimgrep_arguments, '!**/.git/*')
      require('telescope').load_extension 'aerial'

      -- require("telescope").load_extension("grapple")
      local prompt_chars = require('telescope').setup {
        defaults = {
          vimgrep_arguments = vimgrep_arguments,
          borderchars = {
            prompt = { '▔', '▕', '▁', '▏', '🭽', '🭾', '🭿', '🭼' },
            preview = { '▔', '▕', '▁', ' ', '▔', '🭾', '🭿', '▁' },
            results = { '▔', '▕', ' ', '▏', '🭽', '🭾', '▕', '▏' },
          },

          mappings = {
            i = {
              ['<C-j>'] = require('telescope.actions').move_selection_next,
              ['<C-k>'] = require('telescope.actions').move_selection_previous,
            },
          },
        },
        pickers = {
          find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = {
              'rg',
              '--files',
              '--ignore',
              '--hidden',
              '-u',
              '--glob',
              '!**/.git/*',
              '--glob',
              '!**/node_modules/*',
              '--glob',
              '!**/.next/*',
              '--glob',
              '!**/dist/*',
            },
          },
          colorscheme = {
            enable_preview = true,
          },
        },
        extensions = {
          fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = 'smart_case',       -- or "ignore_case" or "respect_case"
            -- the default case_mode is "smart_case"
          },
        },
      }
    end,
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    build =
    'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
  },
}
