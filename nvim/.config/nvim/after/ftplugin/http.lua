local kulala = require('kulala')

vim.keymap.set('n', '<CR>', kulala.run,
  { desc = 'Execute request', buffer = true })

-- Jump to previous request
vim.keymap.set('n', '[r', kulala.jump_prev,
  { desc = 'Jump to the previous request', buffer = true })

-- Jump to next request
vim.keymap.set('n', ']r', kulala.jump_next,
  { desc = 'Jump to the next request', buffer = true })
-- Inspect
vim.keymap.set('n', '<leader>i', kulala.inspect,
  { desc = 'Inspect the current request', buffer = true })

-- Toggle body and headers
vim.keymap.set('n', '<leader>t', kulala.toggle_view,
  { desc = 'Toggle between body and headers', buffer = true })

-- Copy the current request as curl
vim.keymap.set('n', '<leader>co', kulala.copy,
  { desc = 'Copy the current request as a curl command', buffer = true })

-- Insert from curl
vim.keymap.set('n', '<leader>ci', kulala.from_curl,
  { desc = 'Paste curl from clipboard as http request', buffer = true })
