local plugins = {
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    build = 'cd app && yarn install',
    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,
    ft = { 'markdown' },
  },

  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
    opts = {},
  },

  {
    'tadmccorkle/markdown.nvim',
    ft = 'markdown',
    opts = {},
  },

  {
    '3rd/image.nvim',
    opts = {},
  },

  {
    'HakonHarnes/img-clip.nvim',
    event = 'VeryLazy',
    opts = {
      -- add options here
      -- or leave it empty to use the default settings
    },
    keys = {
      -- suggested keymap
      { '<leader>p', '<cmd>PasteImage<cr>', desc = 'Paste image from system clipboard' },
    },
  },
  {
    'kaymmm/bullets.nvim',
    config = function()
      require('Bullets').setup()
    end,
  },
  { 'lukas-reineke/headlines.nvim' },
}

return plugins
