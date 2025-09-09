return {
  -- Lsp notifications
  'j-hui/fidget.nvim',
  config = function()
    require('fidget').setup {
      notification = {
        override_vim_notify = true,
        window = {
          normal_hl = 'Pmenu',
          winblend = 0,
          border = 'solid',
          y_padding = 1,
        },
      },
    }
  end,
}
