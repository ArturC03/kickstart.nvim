local plugins = {
  {
    'echasnovski/mini.animate',
    recommended = true,
    event = 'VeryLazy',
    cond = vim.g.neovide == nil,
    opts = function(_, opts)
      -- Não usar animações ao rolar com o rato
      local mouse_scrolled = false
      for _, scroll in ipairs { 'Up', 'Down' } do
        local key = '<ScrollWheel' .. scroll .. '>'
        vim.keymap.set({ '', 'i' }, key, function()
          mouse_scrolled = true
          return key
        end, { expr = true })
      end

      -- Desativar animações para o tipo de ficheiro 'grug-far'
      vim.api.nvim_create_autocmd('FileType', {
        pattern = 'grug-far',
        callback = function()
          vim.b.minianimate_disable = true
        end,
      })

      -- Alternar animações com a tecla <leader>ua
      local snacks_ok, snacks = pcall(require, 'snacks')
      if snacks_ok then
        -- Se Snacks estiver instalado, use-o para alternar
        snacks
          .toggle({
            name = 'Mini Animate',
            get = function()
              return not vim.g.minianimate_disable
            end,
            set = function(state)
              vim.g.minianimate_disable = not state
            end,
          })
          :map '<leader>ua'
      else
        -- Se Snacks não estiver disponível, faça a alternância manualmente
        vim.keymap.set('n', '<leader>ua', function()
          vim.g.minianimate_disable = not vim.g.minianimate_disable
        end, { desc = 'Toggle Mini Animate' })
      end

      -- Configurar animações
      local animate = require 'mini.animate'
      return vim.tbl_deep_extend('force', opts, {
        -- Aplica animação a redimensionamento
        resize = {
          timing = animate.gen_timing.linear { duration = 50, unit = 'total' },
        },
        -- Aplica animação ao movimento de rolagem
        scroll = {
          timing = animate.gen_timing.linear { duration = 150, unit = 'total' },
          subscroll = animate.gen_subscroll.equal {
            predicate = function(total_scroll)
              if mouse_scrolled then
                mouse_scrolled = false
                return false
              end
              return total_scroll > 1
            end,
          },
        },
        -- Aplica animação a movimentos e comandos
        move = {
          timing = animate.gen_timing.linear { duration = 100, unit = 'total' },
        },
      })
    end,
  },
}

return plugins
