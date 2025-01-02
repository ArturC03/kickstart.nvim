local plugins = {
  { 'williamboman/nvim-lsp-installer' },
  { 'nvimdev/lspsaga.nvim' },
  {
    'onsails/lspkind.nvim',
    config = function()
      local lspkind = require 'lspkind'
      require('cmp').setup {
        formatting = {
          format = lspkind.cmp_format {
            mode = 'symbol', -- show only symbol annotations
            maxwidth = 50, -- prevent the popup from showing more than 50 characters
            ellipsis_char = '...', -- truncate overflow with ellipsis
            before = function(entry, vim_item)
              -- Modify vim_item here if needed
              return vim_item
            end,
          },
        },
      }
    end,
  },
}

return plugins
