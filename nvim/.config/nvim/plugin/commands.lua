-- Restart syntax highlighting
vim.api.nvim_create_user_command('FixSyntax', 'syntax sync fromstart', { desc = 'reload syntax highlighting' })

-- Reload special git registers
vim.api.nvim_create_user_command('Rreg', function()
  vim.cmd 'do User FugitiveChanged'
end, { desc = 'Reset git registers' })

-- Print full path to current buffer
vim.api.nvim_create_user_command('Path', function()
  local path = vim.fn.expand '%:p'
  print(path)
end, { desc = 'Print full path of current buffer' })
