-- Treesitter
return {
  {
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      -- 'nvim-treesitter/nvim-treesitter-context',
    },
    -- tag = "v0.9.3",
    build = ':TSUpdate',
    lazy = false,
    config = function()
      require 'config.treesitter'
    end,
  },
}
