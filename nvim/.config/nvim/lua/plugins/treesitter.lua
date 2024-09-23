-- Treesitter
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
    tag = 'v0.9.2',
    lazy = false,
    config = function()
      require('config.treesitter').setup()
    end,
  },
}
