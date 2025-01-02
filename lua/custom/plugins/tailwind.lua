local plugins = {
  { 'themaxmarchuk/tailwindcss-colors.nvim' },
  {
    'roobert/tailwindcss-colorizer-cmp.nvim',
    config = function()
      -- Setting up the plugin
      require('tailwindcss-colorizer-cmp').setup {
        color_square_width = 2, -- Customize the color square width
      }

      -- Ensure it's configured with nvim-cmp
      local cmp = require 'cmp'
      cmp.setup {
        formatting = {
          format = require('tailwindcss-colorizer-cmp').formatter,
        },
      }
    end,
    dependencies = { 'nvim-cmp' },
    ft = { 'php', 'blade', 'jsx', 'tsx', 'html', 'css', 'javascript', 'typescript' }, -- Specify file types
  },

  -- tailwind-tools.lua
  {
    'luckasRanarison/tailwind-tools.nvim',
    name = 'tailwind-tools',
    build = ':UpdateRemotePlugins',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-telescope/telescope.nvim', -- optional
      'neovim/nvim-lspconfig', -- optional
    },
    opts = {}, -- your configuration
  },
}

return plugins
