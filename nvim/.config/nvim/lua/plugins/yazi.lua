return {
  -- Yazi extension
  {
    'mikavilpas/yazi.nvim',
    event = 'VeryLazy',
    keys = {
      {
        '<leader>-',
        '<CMD>Yazi cwd<CR>',
        desc = 'Open yazi at cwd',
      },
      {
        '<leader>_',
        '<CMD>Yazi<CR>',
        desc = 'Open yazi at the current file',
      },
    },
  },
}
