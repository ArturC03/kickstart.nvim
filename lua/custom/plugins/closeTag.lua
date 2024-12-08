return {
  'alvan/vim-closetag',
  config = function()
    -- Configurar o plugin para também funcionar com PHP
    vim.g.closetag_filetypes = 'html,xhtml,phtml,php' -- Adicione 'php' à lista de tipos de arquivos
    vim.g.closetag_filenames = '*.html,*.xhtml,*.phtml,*.php' -- Adicione '*.php' para arquivos PHP
  end,
}
