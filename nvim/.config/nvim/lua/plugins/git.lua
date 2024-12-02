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
      require('gitsigns').setup {}
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
    config = function()
      require('neogit').setup {}
    end,
  },

  -- Branch viewer
  {
    'rbong/vim-flog',
    event = 'VeryLazy',
  },
}
