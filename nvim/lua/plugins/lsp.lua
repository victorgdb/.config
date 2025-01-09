return {
  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim',           -- optional
      'williamboman/mason-lspconfig.nvim', -- optional
    },
    config = function()
      require('lsp-setup').setup {
        default_mappings = false,
        mappings = {
          gd = 'lua vim.lsp.buf.definition()',
          ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
        },
        servers = {
          lua_ls = {
            settings = {
              Lua = {
                diagnostics = {
                  globals = { 'vim' },
                },
                hint = {
                  enable = true,
                },
              },
            },
          },
          pylsp = {
            autostart = true,
            settings = {
              pylsp = {
                plugins = {
                  pycodestyle = { enabled = false },
                  black = {
                    enabled = false,
                    cache_config = true,
                  },
                  pylsp_mypy = {
                    enabled = false,
                    live_mode = true,
                    dmypy = true,
                    report_progress = true,
                  },
                  isort = {
                    enabled = false,
                  },
                  ruff = {
                    enabled = true,
                  },
                  jedi_completion = { fuzzy = true },
                  -- to install plugins:
                  -- :PylspInstall pylsp-mypy
                  -- :PylspInstall pyls-isort
                  -- :PylspInstall python-lsp-black
                }
              }
            },
          },
          markdown_oxide = {},
          prismals = {},
          terraformls = {},
          yamlls = {},
          -- jsonls = {
          --   settings = {
          --     tabSize = 110,
          --     provideFormatter = false,
          --   },
          --   init_options = {
          --     provideFormatter = false,
          --   },
          --   on_attach = function(client)
          --     client.resolved_capabilities.document_formatting = false
          --   end,
          -- },
          eslint = {},
          tailwindcss = {},
          biome = {},
          ts_ls = {
            on_attach = function(client)
              -- Don't use tsserver for formatting, use eslint or biome instead
              client.server_capabilities.documentFormattingProvider = false
            end,
          },
        },
      }
      vim.api.nvim_create_autocmd('LspAttach', {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if client == nil then
            return
          end
          if client.name == 'markdown_oxide' then
            vim.api.nvim_create_user_command('Daily', function(args)
              local input = args.args

              vim.lsp.buf.execute_command { command = 'jump', arguments = { input } }
            end, { desc = 'Open daily note', nargs = '*' })
          end
          -- if client.supports_method('textDocument/format') and client.name ~= "tsserver" then
          --   vim.cmd [[
          --     augroup format_on_save
          --       au!
          --       autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
          --     augroup END
          --   ]]
          -- end
        end
      })
    end,
  },
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta', lazy = true },
  'onsails/lspkind.nvim',
  {
    'saghen/blink.cmp',
    -- optional: provides snippets for the snippet source
    dependencies = 'rafamadriz/friendly-snippets',

    -- use a release tag to download pre-built binaries
    version = '*',
    -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
    -- build = 'cargo build --release',
    -- If you use nix, you can build from source using latest nightly rust with:
    -- build = 'nix run .#build-plugin',

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      completion = {
        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        -- Display a preview of the selected item on the current line
        -- ghost_text = { enabled = true },
        list = {
          selection = { preselect = true }
        }
      },
      -- 'default' for mappings similar to built-in completion
      -- 'super-tab' for mappings similar to vscode (tab to accept, arrow keys to navigate)
      -- 'enter' for mappings similar to 'super-tab' but with 'enter' to accept
      -- See the full "keymap" documentation for information on defining your own keymap.
      keymap = {
        ['<C-a>'] = { 'show', 'show_documentation', 'hide_documentation', 'fallback' },
        ['<CR>'] = { 'select_and_accept', 'fallback' },
        ['<Tab>'] = { 'accept', 'fallback' },

        ['<C-k>'] = { 'select_prev', 'fallback' },
        ['<C-j>'] = { 'select_next', 'fallback' },
      },

      appearance = {
        -- Sets the fallback highlight groups to nvim-cmp's highlight groups
        -- Useful for when your theme doesn't support blink.cmp
        -- Will be removed in a future release
        use_nvim_cmp_as_default = true,
        -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
        -- Adjusts spacing to ensure icons are aligned
        nerd_font_variant = 'mono'
      },

      -- Default list of enabled providers defined so that you can extend it
      -- elsewhere in your config, without redefining it, due to `opts_extend`
      sources = {
        default = { 'lsp', 'path', 'buffer' },
      },
    },
    opts_extend = { "sources.default" }
  }
}
