local plugins = {
  {
    'kanenorman/gruvbox-darker.nvim',
    priority = 1000,
    config = function()
      -- Configuração do esquema de cores
      vim.o.background = 'dark' -- ou "light" para o modo claro
    end,
    opts = {},
  },
}

return plugins
