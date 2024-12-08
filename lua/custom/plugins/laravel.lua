-- Plugin list for kickstart.nvim
local plugins = {
  -- Blade syntax highlighting plugin
  { 'jwalton512/vim-blade' },

  -- Laravel specific plugin
  {
    'adalessa/laravel.nvim',
    dependencies = {
      'tpope/vim-dotenv', -- .env file support
      'MunifTanjim/nui.nvim', -- UI components for Telescope
      'kevinhwang91/promise-async', -- Async utilities
    },
    cmd = { 'Laravel' }, -- Lazy load on command
    keys = { -- Key mappings for Laravel
      { '<leader>la', ':Laravel artisan<cr>' },
      { '<leader>lr', ':Laravel routes<cr>' },
      { '<leader>lm', ':Laravel related<cr>' },
    },
    event = { 'VeryLazy' }, -- Load when Neovim is idle
    opts = {},
    config = function()
      -- Additional Laravel plugin configuration (if needed)
    end,
  },

  -- LSP for PHP with Blade support (assuming nvim-lspconfig is already present)
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
    event = 'VeryLazy', -- Load lazily
  },

  -- Auto-completion plugin (nvim-cmp)
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp', -- LSP completion source
      'hrsh7th/cmp-buffer', -- Buffer completion source
      'hrsh7th/cmp-path', -- Path completion source
      'hrsh7th/cmp-cmdline', -- Cmdline completion source
    },
    config = function()
      local cmp = require 'cmp'
      cmp.setup {
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- Use Luasnip for snippets
          end,
        },
        mapping = {
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-y>'] = cmp.mapping.confirm { select = true },
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
          { name = 'cmdline' },
        },
      }

      -- Blade-specific completion setup
      cmp.setup.filetype('blade', {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
          { name = 'path' },
        },
      })
    end,
    event = 'VeryLazy', -- Load lazily
  },

  -- Snippet manager (Luasnip) - assuming you already have it in your config
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
    event = 'VeryLazy', -- Load lazily
  },

  -- Auto-pairing plugin for Blade tags and other pairs
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
        enable_afterquote = true,
        disable_filetype = { 'TelescopePrompt', 'vim' },
      }
    end,
    event = 'VeryLazy', -- Load lazily
  },

  -- Telescope for searching Laravel related things (assuming it's already in your config)
  { 'nvim-telescope/telescope.nvim', event = 'VeryLazy' },

  -- Plugin for .env file support (if you already have vim-dotenv, you can skip this)
  { 'tpope/vim-dotenv', event = 'VeryLazy' },

  -- UI components for Telescope (only needed if nui.nvim isn't already in your config)
  { 'MunifTanjim/nui.nvim', event = 'VeryLazy' },

  -- Async utilities for promises (only if promise-async is not already in your config)
  { 'kevinhwang91/promise-async', event = 'VeryLazy' },
}

-- Filetype-specific configurations
vim.cmd [[
  autocmd FileType blade setlocal shiftwidth=4 softtabstop=4 expandtab  " Set indentation for Blade files
  autocmd FileType blade set filetype=php                            " Force .blade.php to use PHP filetype
]]

-- Return the plugin list for kickstart.nvim
return plugins
