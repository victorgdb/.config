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
return {
  {
    'neovim/nvim-lspconfig',
    event = { 'BufReadPre', 'BufNewFile', 'BufWritePre' },
    dependencies = {
      'williamboman/mason.nvim',
      {
        'williamboman/mason-lspconfig.nvim',
        opt = true,
      },
      {
        'SmiteshP/nvim-navbuddy',
        dependencies = {
          'SmiteshP/nvim-navic',
          'MunifTanjim/nui.nvim',
        },
        opts = { lsp = { auto_attach = true } },
      },
    },
    config = function()
      local on_attach = function(client, bufnr)
        if client.supports_method 'textDocument/formatting' then
          vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
          vim.api.nvim_create_autocmd('BufWritePre', {
            group = augroup,
            buffer = bufnr,
            callback = function()
              lsp_formatting(bufnr)
            end,
          })
        end
      end
      local lspconfig = require 'lspconfig'
      lspconfig.prismals.setup {}
      lspconfig.tsserver.setup {
        on_attach = function(client, bufnr)
          client.resolved_capabilities.document_formatting = false
          on_attach(client, bufnr)
        end,
      }
      lspconfig.yamlls.setup {}
      lspconfig.jsonls.setup {
        tabSize = 110,
      }
      lspconfig.tailwindcss.setup {}
    end,
  },
  {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'prismals', 'jsonls', 'sqlls' },
      }
    end,
  },
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },
  'hrsh7th/cmp-nvim-lsp',
  {
    'hrsh7th/nvim-cmp',
    config = function()
      local cmp = require 'cmp'
      local lspkind = require 'lspkind'
      cmp.setup {
        formatting = {
          format = lspkind.cmp_format {
            maxwidth = 50,
            show_labelDetails = true,
            before = function(entry, vim_item)
              return vim_item
            end,
          },
          format = require('tailwindcss-colorizer-cmp').formatter,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<D-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ['<C-j>'] = cmp.mapping.select_next_item(),
          ['<C-k>'] = cmp.mapping.select_prev_item(),
        },
        snippet = {
          expand = function(args)
            local luasnip = prequire 'luasnip'
            if not luasnip then
              return
            end
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = cmp.config.sources {
          { name = 'neorg' },
          { name = 'nvim_lsp_signature_help' },
          { name = 'luasnip' },
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
      }
    end,
  },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    -- optionally, override the default options:
    config = function()
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2,
      }
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    dependencies = {
      'nvimtools/none-ls-extras.nvim',
    },
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        on_attach = function(client, bufnr)
          if client.supports_method 'textDocument/formatting' then
            vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                lsp_formatting(bufnr)
              end,
            })
          end
        end,
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.pg_format,
          require 'none-ls.code_actions.eslint_d',
          require 'none-ls.diagnostics.eslint_d',
          require 'none-ls.formatting.eslint_d',
          -- null_ls.builtins.formatting.sqlfluff.with {
          --   extra_args = { '--dialect', 'bigquery' }, -- change to your dialect
          -- },
        },
      }
    end,
  },
  'onsails/lspkind.nvim',
}
