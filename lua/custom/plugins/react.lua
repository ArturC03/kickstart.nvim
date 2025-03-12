return {
  -- Plugin para autocompletar e renomear automaticamente tags em JSX/HTML
  {
    'windwp/nvim-ts-autotag',
    ft = { 'javascriptreact', 'typescriptreact', 'html' },
    config = function()
      require('nvim-ts-autotag').setup()
    end,
  },

  -- Plugin para fornecer snippets
  {
    'L3MON4D3/LuaSnip',
    config = function()
      require('luasnip.loaders.from_vscode').lazy_load()
    end,
  },

  -- Plugin para autocompletar com integração ao LSP e snippets
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'saadparwaiz1/cmp_luasnip',
    },
    config = function()
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<CR>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
        },
      }
    end,
  },

  -- Plugin para formatação automática de código
  {
    'jose-elias-alvarez/null-ls.nvim',
    config = function()
      local null_ls = require 'null-ls'
      null_ls.setup {
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.diagnostics.eslint,
        },
      }
    end,
  },

  -- Plugin para instalação e gerenciamento de servidores LSP, formatadores e linters
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end,
  },

  -- Plugin para integração do Mason com o LSP
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'ts_ls', 'eslint' },
      }

      local lspconfig = require 'lspconfig'
      lspconfig.ts_ls.setup {}
      lspconfig.eslint.setup {}
    end,
  },

  -- Plugin para melhor realce de sintaxe e outras funcionalidades baseadas em árvore de sintaxe
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'javascript', 'typescript', 'tsx', 'html', 'css' },
        highlight = { enable = true },
        indent = { enable = true },
        autotag = { enable = true },
      }
    end,
  },
}
