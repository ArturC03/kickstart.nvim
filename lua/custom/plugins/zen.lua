local plugins = {
  -- Zen Mode plugin
  {
    'folke/zen-mode.nvim',
    opts = {
      window = {
        width = 0.85, -- width will be 85% of the editor width
      },
    },
    config = function(_, opts)
      require('zen-mode').setup(opts)
      vim.keymap.set('n', '<leader>zm', ':ZenMode<CR>', { desc = 'Toggle Zen Mode' })
    end,
  },
}

return plugins
