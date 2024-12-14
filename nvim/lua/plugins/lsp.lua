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
          -- sqls = {},
          jsonls = {
            settings = {
              tabSize = 110,
              provideFormatter = false,
            },
            init_options = {
              provideFormatter = false,
            },
            on_attach = function(client)
              client.resolved_capabilities.document_formatting = false
            end,
          },
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
          if client.name == "markdown_oxide" then
            vim.api.nvim_create_user_command(
              "Daily",
              function(args)
                local input = args.args

                vim.lsp.buf.execute_command({ command = "jump", arguments = { input } })
              end,
              { desc = 'Open daily note', nargs = "*" }
            )
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
  'hrsh7th/cmp-nvim-lsp',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      local cmp_kinds = {
        Text = '  ',
        Method = '  ',
        Function = '  ',
        Constructor = '  ',
        Field = '  ',
        Variable = '  ',
        Class = '  ',
        Interface = '  ',
        Module = '  ',
        Property = '  ',
        Unit = '  ',
        Value = '  ',
        Enum = '  ',
        Keyword = '  ',
        Snippet = '  ',
        Color = '  ',
        File = '  ',
        Reference = '  ',
        Folder = '  ',
        EnumMember = '  ',
        Constant = '  ',
        Struct = '  ',
        Event = '  ',
        Operator = '  ',
        TypeParameter = '  ',
      }
      cmp.setup {
        window = {
          completion = {
            col_offset = -3,
            side_padding = 0,
          },
        },
        formatting = {
          expandable_indicator = false,
          fields = { 'kind', 'abbr', 'menu' },
          format = function(entry, vim_item)
            vim_item.kind = (cmp_kinds[vim_item.kind] or '') .. vim_item.kind
            return vim_item
            -- local kind = require("lspkind").cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
            -- local strings = vim.split(kind.kind, "%s", { trimempty = true })
            -- kind.kind = " " .. (strings[1] or "") .. " "
            -- kind.menu = "    (" .. (strings[2] or "") .. ")"
            -- return kind
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<D-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
        },
        sources = cmp.config.sources {
          { name = 'orgmode' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'nvim_lsp', option = {
            markdown_oxide = {
              keyword_pattern = [[\(\k\| \|\/\|#\)\+]]
            }
          } },
          { name = 'buffer' },
          { name = 'lazydev' },
        },
      }
    end,
  },
  'onsails/lspkind.nvim',
}
