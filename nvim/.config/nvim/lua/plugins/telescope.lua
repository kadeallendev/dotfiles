-- This is only used for other plugins that don't support fzf-lua
return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- {
      --   'nvim-telescope/telescope-fzf-native.nvim',
      --   build = 'make',
      --   cond = function()
      --     return vim.fn.executable 'make' == 1
      --   end,
      -- },
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'plugins.config.cfg-telescope'
    end,
  },
}
