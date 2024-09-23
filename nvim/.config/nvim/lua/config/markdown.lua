local markdown = require 'render-markdown'

markdown.setup {
  render_modes = { 'n', 'c' },
  enabled = false, -- Disable by default
}

-- Toggle rendering
vim.keymap.set('n', '<leader>m', function()
  markdown.toggle()
end, { desc = 'Toggle markdown rendering' })
