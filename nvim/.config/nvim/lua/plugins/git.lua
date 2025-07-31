return {
  -- Git fugitive
  {
    'tpope/vim-fugitive',
  },

  -- Fugitive integration with GitHub
  -- Brings :GBrowse
  -- Enables issue, issue URLs, and collaborators to be omnicompleted with <C-X><C-O>
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
    config = true,
  },

  -- Diffview
  {
    'sindrets/diffview.nvim',
    cmd = 'DiffviewOpen',
  },

  -- Branch viewer
  {
    'rbong/vim-flog',
    cmd = 'Flog',
  },
}
