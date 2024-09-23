-- Restart syntax highlighting
vim.api.nvim_create_user_command('FixSyntax', 'syntax sync fromstart', { desc = 'reload syntax highlighting' })

-- Toggle spell checking
vim.api.nvim_create_user_command('Tspell', 'setlocal spell! spell?', { desc = 'Toggle spell check' })

-- Toggle wrapping
vim.api.nvim_create_user_command('Twrap', 'setlocal wrap! nowrap?', { desc = 'Toggle line wrapping' })

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

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Disable automatic comment on enter
vim.cmd [[autocmd FileType * setlocal formatoptions-=cro]]
