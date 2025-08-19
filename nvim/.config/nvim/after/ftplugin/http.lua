vim.api.nvim_buf_set_keymap(0, 'n', '<CR>', "<cmd>lua require('kulala').run()<CR>",
  { silent = true, desc = 'Execute request' })

-- Jump to previous request
vim.api.nvim_buf_set_keymap(0, 'n', '[r', "<cmd>lua require('kulala').jump_prev()<cr>",
  { silent = true, desc = 'Jump to the previous request' })

-- Jump to next request
vim.api.nvim_buf_set_keymap(0, 'n', ']r', "<cmd>lua require('kulala').jump_next()<cr>",
  { silent = true, desc = 'Jump to the next request' })
-- Inspect
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>i', "<cmd>lua require('kulala').inspect()<cr>",
  { silent = true, desc = 'Inspect the current request' })

-- Toggle body and headers
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>t', "<cmd>lua require('kulala').toggle_view()<cr>",
  { silent = true, desc = 'Toggle between body and headers' })

-- Copy the current request as curl
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>co', "<cmd>lua require('kulala').copy()<cr>",
  { silent = true, desc = 'Copy the current request as a curl command' })

-- Insert from curl
vim.api.nvim_buf_set_keymap(0, 'n', '<leader>ci', "<cmd>lua require('kulala').from_curl()<cr>",
  { silent = true, desc = 'Paste curl from clipboard as http request' })
