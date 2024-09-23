-- Restart syntax highlighting
vim.api.nvim_create_user_command('FixSyntax', 'syntax sync fromstart', { desc = 'reload syntax highlighting' })

-- Toggle spell checking
vim.api.nvim_create_user_command('Tspell', 'setlocal spell! spell?', { desc = 'Toggle spell check' })

-- Toggle wrapping
vim.api.nvim_create_user_command('Twrap', 'setlocal wrap! nowrap?', { desc = 'Toggle line wrapping' })

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
