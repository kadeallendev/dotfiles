-- LaTeX equation viewer
return {
  'jbyuki/nabla.nvim',
  event = 'VeryLazy',
  config = function()
    local nabla = require 'nabla'
    vim.keymap.set('n', '<leader>p', nabla.popup, { desc = 'Display latex equation' })
  end,
}
