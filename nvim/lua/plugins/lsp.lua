local lsp_formatting = function(bufnr)
  vim.lsp.buf.format {
    async = false,
    timeout_ms = 10000,
    filter = function(client)
      return client.name == 'null-ls'
    end,
    bufnr = bufnr,
  }
end

local local_on_attach = function(client, bufnr)
  if client.supports_method 'textDocument/formatting' then
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      callback = function()
        lsp_formatting(bufnr)
      end,
    })
  end
end

return {
  {
    'junnplus/lsp-setup.nvim',
    dependencies = {
      'neovim/nvim-lspconfig',
      'williamboman/mason.nvim', -- optional
      'williamboman/mason-lspconfig.nvim', -- optional
    },
    config = function()
      require('lsp-setup').setup {
        inlay_hints = {
          enabled = false,
        },
        servers = {
          lua_ls = {
            on_attach = local_on_attach,
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
          prismals = {},
          yamlls = {},
          jsonls = {
            settings = {
              tabSize = 110,
            },
          },
          tailwindcss = {},
          tsserver = {
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = 'all',
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = false,
                  includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
            on_attach = local_on_attach,
          },
        },
      }
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
      local lspkind = require 'lspkind'
      cmp.setup {
        formatting = {
          expandable_indicator = false,
          fields = { 'abbr', 'menu', 'kind' },
          format = function(entry, item)
            local content = item.abbr
            local fixed_width = false
            local win_width = vim.api.nvim_win_get_width(0)
            local max_content_width = fixed_width and fixed_width - 10 or math.floor(win_width * 0.2)

            if #content > max_content_width then
              item.abbr = vim.fn.strcharpart(content, 0, max_content_width - 3) .. '...'
            else
              item.abbr = content .. (' '):rep(max_content_width - #content)
            end
            return item
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
          { name = 'neorg' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'lazydev' },
        },
      }
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'roobert/tailwindcss-colorizer-cmp.nvim',
      'nvimtools/none-ls-extras.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        on_attach = local_on_attach,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.pg_format,
          require 'none-ls.code_actions.eslint_d',
          require 'none-ls.diagnostics.eslint_d',
          require 'none-ls.formatting.eslint_d',
        },
      }
    end,
  },
  'onsails/lspkind.nvim',
}
