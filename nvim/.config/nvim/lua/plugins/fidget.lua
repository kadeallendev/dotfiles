return {
  -- Lsp notifications
  {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup {
        notification = {
          override_vim_notify = true,
          window = {
            normal_hl = 'Pmenu',
            winblend = 100,
            border = 'rounded',
          },
        },
      }
    end,
  },
}
