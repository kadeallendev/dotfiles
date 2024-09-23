-- Equation viewer
return {
  'jbyuki/nabla.nvim',
  config = function()
    local nabla = require 'nabla'
    vim.keymap.set('n', '<leader>p', nabla.popup, { desc = 'Display latex equation' })
  end,
}
