-- Keymaps for toggling options

-- Wrapping
vim.keymap.set('n', '<leader>twr', '<CMD>setlocal wrap! wrap?<CR>')

-- Cursor line
vim.keymap.set('n', '<leader>tcl', '<CMD>setlocal cursorline! cursorline?<CR>', { desc = 'Toggle Cursor Line (Local)' })

-- Cursor column
vim.keymap.set('n', '<leader>tcc', '<CMD>setlocal cursorcolumn! cursorcolumn?<CR>', { desc = 'Toggle Cursor Column (Local)' })

-- Color column
vim.keymap.set('n', '<leader>tCc', function()
  if vim.o.colorcolumn == '' then
    vim.o.colorcolumn = '80'
  else
    vim.o.colorcolumn = ''
  end
end, { desc = 'Toggle color column' })

-- Diagnostics
vim.keymap.set('n', '<leader>td', function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = 'Toggle diagnostics' })

-- Spell
vim.keymap.set('n', '<leader>ts', '<CMD>setlocal spell! spell?<CR>', { desc = 'Toggle Spell (Local)' })

-- Fold column
vim.keymap.set('n', '<leader>tfc', function()
  local cur_val = vim.wo.foldcolumn
  if cur_val == '0' then
    vim.wo.foldcolumn = 'auto'
  else
    vim.wo.foldcolumn = '0'
  end
end, { desc = 'Toggle foldcolumn' })

-- Statusline
vim.keymap.set('n', '<leader>tS', require('kade.statusline-toggle').toggle, { desc = 'Toggle statusline' })
