-- Restart syntax highlighting
vim.api.nvim_create_user_command('FixSyntax', 'syntax sync fromstart', { desc = 'reload syntax highlighting' })

-- Toggle spell checking
vim.api.nvim_create_user_command('Tspell', 'setlocal spell! spell?', { desc = 'Toggle spell check' })

-- Toggle wrapping
vim.api.nvim_create_user_command('Twrap', 'setlocal wrap! nowrap?', { desc = 'Toggle line wrapping' })

-- Toggle cursor line
vim.api.nvim_create_user_command('Tcl', 'setlocal cursorline!', { desc = 'Toggle cursor line' })

-- Toggle diagnostics
vim.g['diagnostics_active'] = true
local function toggle_diagnostics()
  if vim.g.diagnostics_active then
    vim.g.diagnostics_active = false
    vim.diagnostic.enable(false)
  else
    vim.g.diagnostics_active = true
    vim.diagnostic.enable()
  end
end
vim.api.nvim_create_user_command('Tdiag', toggle_diagnostics, { desc = 'Toggle diagnostics' })

-- Reload special git registers
vim.api.nvim_create_user_command('Rreg', function()
  vim.cmd 'do User FugitiveChanged'
end, { desc = 'Reset git registers' })

-- Toggle foldcolumn
vim.api.nvim_create_user_command('Tfc', function()
  local current_value = vim.wo.foldcolumn
  if current_value == '0' then
    vim.wo.foldcolumn = 'auto'
  else
    vim.wo.foldcolumn = '0'
  end
end, { desc = 'Toggle foldcolumn between 0 and auto' })
