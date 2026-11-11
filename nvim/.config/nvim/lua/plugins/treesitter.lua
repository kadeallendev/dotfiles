-- Treesitter
return {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    { 'nvim-treesitter/nvim-treesitter-textobjects', branch = 'main' },
    -- 'nvim-treesitter/nvim-treesitter-context',
  },
  build = ':TSUpdate',
  lazy = false,
  config = function()
    require 'plugins.config.cfg-treesitter'
  end,
}
