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
      local lspconfig = require 'lspconfig'
      lspconfig.tsserver.setup {}
      lspconfig.eslint.setup {}
      lspconfig.tailwindcss.setup {}
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
        },
        snippet = {
          expand = function(args)
            vim.fn['vsnip#anonymous'](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<D-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = cmp.config.sources {
          { name = 'nvim_lsp' },
          { name = 'vsnip' },
          { name = 'buffer' },
          { name = 'nvim_lsp_signature_help' },
        },
      }
    end,
  },
  {
    'nvimtools/none-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'

      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.stylua,
          null_ls.builtins.formatting.pg_format,
          -- null_ls.builtins.formatting.sqlfluff.with {
          --   extra_args = { '--dialect', 'bigquery' }, -- change to your dialect
          -- },
        },
      }
    end,
  },
  'onsails/lspkind.nvim',
}
