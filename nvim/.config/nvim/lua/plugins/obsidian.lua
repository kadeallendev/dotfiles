-- Obsidian integration
return {
  {
    'epwalsh/obsidian.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      require 'config.obsidian'
    end,
  },
}
