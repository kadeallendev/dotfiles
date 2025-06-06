return {
  -- Git fugitive
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
  },
  {
    'tpope/vim-rhubarb',
    event = 'VeryLazy',
    dependencies = {
      'tpope/vim-fugitive',
    },
  },

  -- Gitsigns
  {
    'lewis6991/gitsigns.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function() end,
  },

  -- Diffview
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
  },

  -- Neogit
  -- {
  --   'neogitorg/neogit',
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --     'sindrets/diffview.nvim',
  --     -- 'nvim-telescope/telescope.nvim',
  --     'ibhagwan/fzf-lua',
  --   },
  --   event = 'VeryLazy',
  --   config = function()
  --     require('neogit').setup {}
  --   end,
  -- },

  -- Branch viewer
  {
    'rbong/vim-flog',
    event = 'VeryLazy',
  },
}
