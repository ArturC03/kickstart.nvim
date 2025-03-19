-- Lista de plugins para kickstart.nvim
local plugins = {
  -- Plugin para realce de sintaxe Blade
  { 'jwalton512/vim-blade' },

  -- Plugin específico para Laravel
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'tpope/vim-dotenv', -- Suporte para ficheiros .env
      'MunifTanjim/nui.nvim', -- Componentes UI para Telescope
      'kevinhwang91/promise-async', -- Utilitários assíncronos
    },
    cmd = { 'Laravel' }, -- Carregamento sob demanda ao usar o comando
    keys = { -- Mapeamentos de teclas para Laravel
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' }, -- Carregar quando o Neovim estiver inativo
    opts = {},
    config = function()
      -- Configuração adicional do plugin Laravel (se necessário)
    end,
  },

  -- Configuração do nvim-treesitter para suporte a PHP e Blade
  {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'php', 'blade' }, -- Instalar parsers para PHP e Blade
        highlight = {
          enable = true, -- Ativar realce de sintaxe
        },
      }
    end,
    event = 'BufRead', -- Carregar ao ler um ficheiro
  },

  -- LSP para PHP com suporte a Blade
  {
    'neovim/nvim-lspconfig',
    config = function()
      require('lspconfig').intelephense.setup {
        settings = {
          php = {
            validate = { enable = true },
            suggest = { enable = true },
          },
        },
      }
    end,
    event = 'VeryLazy', -- Carregar de forma preguiçosa
  },

  -- Plugin de auto-completação (nvim-cmp)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- Fonte de completação LSP
      'hrsh7th/cmp-buffer', -- Fonte de completação de buffer
      'hrsh7th/cmp-path', -- Fonte de completação de caminho
      'hrsh7th/cmp-cmdline', -- Fonte de completação de linha de comando
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Usar Luasnip para snippets
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<CR>'] = cmp.mapping.confirm { select = true }, -- Alterado para <CR> para a tecla Enter
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
        },
      }

      -- Configuração específica para Blade
      cmp.setup.filetype('blade', {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end,
    event = 'InsertEnter',
  },

  -- Gerenciador de snippets (Luasnip)
  {
    'L3MON4D3/Luasnip',
    config = function()
      local ls = require 'luasnip'
      ls.snippets = {
        blade = {
          ls.parser.parse_snippet('foreach', '@foreach ($items as $item)\n  ...\n@endforeach'),
          ls.parser.parse_snippet('if', '@if ($condition)\n  ...\n@endif'),
        },
      }
    end,
    event = 'VeryLazy', -- Carregar de forma preguiçosa
  },

  -- Plugin de auto-fechamento para tags Blade e outros pares
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
        enable_afterquote = true,
        disable_filetype = { 'TelescopePrompt', 'vim' },
      }
    end,
    event = 'InsertEnter', -- Carregar de forma preguiçosa
  },

  -- Telescope para pesquisa relacionada ao Laravel
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },

  -- Plugin para suporte a ficheiros .env
  { 'tpope/vim-dotenv', event = 'VeryLazy' },

  -- Componentes UI para Telescope
  { 'MunifTanjim/nui.nvim', event = 'VeryLazy' },

  -- Utilitários assíncronos para promessas
  { 'kevinhwang91/promise-async', event = 'VeryLazy' },

  -- Componentes adicionais para Blade
  {
    'ricardoramirezr/lali-components.nvim',
    ft = 'blade',
  },

  -- Plugin adicional para Laravel
  {
    'djaruun/laravel.nvim',
    config = true,
  },
}

-- Configurações específicas para tipos de ficheiro
vim.cmd [[
  autocmd FileType blade setlocal shiftwidth=4 softtabstop=4 expandtab  " Definir indentação para ficheiros Blade
  autocmd BufRead,BufNewFile *.blade.php set filetype=blade             " Definir tipo de ficheiro para Blade
]]

return plugins
