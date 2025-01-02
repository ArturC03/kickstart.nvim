local plugins = {
  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup() -- This sets up the plugin
    end,
  },
}

return plugins
