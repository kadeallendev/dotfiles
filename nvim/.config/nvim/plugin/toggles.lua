--- Functions and keymaps for toggling options
local M = {}

------ WRAP ------

--- Toggles 'wrap' option
M.toggle_wrapping = function()
  vim.o.wrap = not vim.o.wrap
  print(vim.o.wrap)
end

vim.keymap.set('n', '<leader>twr', M.toggle_wrapping, { desc = 'Toggle wrap' })

------ CURSOR LINE ------

--- Toggles 'cursorline' option
M.toggle_cursorline = function()
  vim.o.cursorline = not vim.o.cursorline
end

vim.keymap.set('n', '<leader>tcl', M.toggle_cursorline, { desc = 'Toggle cursorline' })

------ CURSOR COLUMN ------

--- Toggles 'cursorcolumn' option
M.toggle_cursorcolumn = function()
  vim.o.cursorcolumn = not vim.o.cursorcolumn
end

vim.keymap.set('n', '<leader>tcc', M.toggle_cursorcolumn, { desc = 'Toggle Cursor Column (Local)' })

------ COLOR COLUMN ------

--- Toggles 'colorcolumn' option between '80' and ''
M.toggle_colorcolumn = function()
  if vim.o.colorcolumn == '' then
    vim.o.colorcolumn = '80'
  else
    vim.o.colorcolumn = ''
  end
end

vim.keymap.set('n', '<leader>tCc', M.toggle_colorcolumn, { desc = 'Toggle color column' })

------ DIAGNOSTICS ------

--- Toggles 'vim.diagnostic' option
M.toggle_diagnostic = function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end

vim.keymap.set('n', '<leader>td', M.toggle_diagnostic, { desc = 'Toggle diagnostics' })

------ SPELL ------

--- Toggles 'spell' option
M.toggle_spell = function()
  vim.o.spell = not vim.o.spell
  print(vim.o.spell)
end

vim.keymap.set('n', '<leader>ts', M.toggle_spell, { desc = 'Toggle Spell (Local)' })

------ FOLD COLUMN ------

M.toggle_foldcolumn = function()
  if vim.wo.foldcolumn == '0' then
    vim.wo.foldcolumn = 'auto'
  else
    vim.wo.foldcolumn = '0'
  end
end

vim.keymap.set('n', '<leader>tfc', M.toggle_foldcolumn, { desc = 'Toggle foldcolumn' })

return M
