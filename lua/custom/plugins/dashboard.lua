local plugins = {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      -- Sua configuração vai aqui
      -- ou deixe em branco para usar as configurações padrão
      -- consulte a seção de configuração abaixo
      bigfile = { enabled = true },
      dashboard = {
        enabled = true,
        preset = {
          header = [[
__________ ____ ________________________    _____   
\______   \    |   \__    ___/\______   \  /  _  \  
 |       _/    |   / |    |    |       _/ /  /_\  \ 
 |    |   \    |  /  |    |    |    |   \/    |    \
 |____|_  /______/   |____|    |____|_  /\____|__  /
        \/                            \/         \/ 
          ]],
        },
      },
      indent = { enabled = true },
      input = { enabled = true },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    },
  },
}

return plugins
