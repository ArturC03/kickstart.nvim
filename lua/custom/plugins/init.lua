local plugins = {
  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end,
  },

  -- Supermaven
  {
    'supermaven-inc/supermaven-nvim',
    config = function()
      require('supermaven-nvim').setup {}
    end,
  },

  -- Neo-tree
  {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
      'MunifTanjim/nui.nvim',
      '3rd/image.nvim', -- Optional image support in preview window: See `# Preview Mode` for more information
    },
  },

  { 'arnamak/stay-centered.nvim' },
  { 'neovim/nvim-lspconfig' }, -- LSP configuration
  { 'hrsh7th/nvim-cmp' }, -- Autocompletion
  { 'hrsh7th/cmp-nvim-lsp' }, -- LSP source for nvim-cmp
  { 'hrsh7th/cmp-buffer' }, -- Buffer source for nvim-cmp
  { 'hrsh7th/cmp-path' }, -- Path source for nvim-cmp
  { 'saadparwaiz1/cmp_luasnip' }, -- Luasnip completion source
  { 'L3MON4D3/LuaSnip' }, -- Snippet Engine
  { 'honza/vim-snippets' }, -- Pre-built snippets for various languages
  { 'tpope/vim-surround' },
  { 'junegunn/fzf.vim' },

  { 'voldikss/vim-floaterm' },
  vim.keymap.set('n', '<leader>ft', ':FloatermToggle<CR>', { desc = '[F]loa [T]erminal' }),

  { 'echasnovski/mini.animate' },
}

return plugins
