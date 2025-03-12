return {
  {
    'Joakker/vim-antlr4',
    ft = { 'antlr4' },
    config = function()
      vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
        pattern = '*.g4',
        command = 'set filetype=antlr4',
      })
    end,
  },
}
