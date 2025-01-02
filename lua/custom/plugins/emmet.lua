local plugins = {
  {
    'olrtg/nvim-emmet',
    config = function()
      vim.keymap.set({ 'n', 'v' }, '<leader>xe', require('nvim-emmet').wrap_with_abbreviation)

      -- Setup for emmet_language_server using lspconfig
      require('lspconfig').emmet_language_server.setup {
        filetypes = {
          'css',
          'eruby',
          'html',
          'javascript',
          'javascriptreact',
          'less',
          'sass',
          'scss',
          'pug',
          'typescriptreact',
          'php',
          'blade',
          'jsx',
          'tsx',
        },
        init_options = {
          includeLanguages = {
            php = 'html',
            blade = 'html',
            jsx = 'javascriptreact',
            tsx = 'typescriptreact',
          },
          excludeLanguages = {},
          extensionsPath = {},
          preferences = {},
          showAbbreviationSuggestions = true,
          showExpandedAbbreviation = 'always',
          showSuggestionsAsSnippets = false,
          syntaxProfiles = {},
          variables = {},
        },
      }
    end,
  },
}

return plugins
