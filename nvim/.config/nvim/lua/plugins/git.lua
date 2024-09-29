return {
  -- Git fugitive
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require 'config.gitsigns'
    end,
  },

  -- Neogit
  {
    'neogitorg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'sindrets/diffview.nvim',
      -- 'nvim-telescope/telescope.nvim',
      'ibhagwan/fzf-lua',
    },
    event = 'VeryLazy',
    config = true,
  },

  -- Branch viewer
  {
    'rbong/vim-flog',
    event = 'VeryLazy',
  },
}
