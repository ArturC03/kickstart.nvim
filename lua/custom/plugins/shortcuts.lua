return {
  vim.keymap.set('n', '<leader>te', function()
    vim.cmd 'Telescope live_grep'
  end, { noremap = true, silent = true }),
}
