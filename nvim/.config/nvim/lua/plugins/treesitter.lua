-- Treesitter
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    tag = 'v0.9.2',
    lazy = false,
    config = function()
      require 'config.treesitter'
    end,
  },
}
