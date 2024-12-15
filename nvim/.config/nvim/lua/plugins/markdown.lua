return {
  -- Display markdown in Neovim
  {
    'MeanderingProgrammer/render-markdown.nvim',
    event = 'VeryLazy',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      require 'config.markdown'
    end,
  },

  -- Better editing of markdown tables
  {
    'Kicamon/markdown-table-mode.nvim',
    ft = 'markdown',
    config = function()
      require('markdown-table-mode').setup()
    end,
  },
}
