return {
  -- Lsp notifications
  {
    'j-hui/fidget.nvim',
    opts = {
      notification = {
        override_vim_notify = true,
        window = {
          winblend = 0,
          border = 'single',
        },
      },
    },
  },
}
