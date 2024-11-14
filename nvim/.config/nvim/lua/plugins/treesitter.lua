-- Treesitter
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'nvim-treesitter/nvim-treesitter-context',
    },
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require 'config.treesitter'
    end,
  },
}
