-- Completion shit
return {
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-nvim-lsp-signature-help',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-cmdline',
      'ray-x/cmp-treesitter',
      'onsails/lspkind.nvim',
      { 'L3MON4D3/LuaSnip', build = 'make install_jsregexp' },
      'saadparwaiz1/cmp_luasnip',
      { 'windwp/nvim-autopairs', config = true }, -- Auto pairs brackets
    },
    config = function()
      require 'config.completion'
    end,
  },
}
