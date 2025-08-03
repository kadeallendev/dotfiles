local set = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = ' '

-- Make relative line jumps with j and k populate the jump list
local rel_cap = 4
set('n', 'j', function()
  if vim.v.count > rel_cap then
    return "m'" .. vim.v.count .. 'j'
  else
    return 'j'
  end
end, { expr = true })
set('n', 'k', function()
  if vim.v.count > rel_cap then
    return "m'" .. vim.v.count .. 'k'
  else
    return 'k'
  end
end, { expr = true })

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })

set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Better location list jumping with ]j and ]w
set('n', '[j', '<CMD>lprev<CR>', { desc = 'Go to previous location in location list' })
set('n', ']j', '<CMD>lnext<CR>', { desc = 'Go to next location in location list' })
set('n', '[w', '<CMD>lprev<CR>', { desc = 'Go to previous location in location list' })
set('n', ']w', '<CMD>lnext<CR>', { desc = 'Go to next location in location list' })

-- Better scrolling
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')

-- Better pasting and deleting
set('x', '<leader>p', [["_dP]])
set('x', '<leader>d', [["_d]])

-- Better horizontal scrolling
set('n', 'zl', 'zL')
set('n', 'zh', 'zH')

-- Tab movement with square brackets
set('n', '[t', '<CMD>tabp<CR>', { desc = 'Next tab' })
set('n', ']t', '<CMD>tabn<CR>', { desc = 'Previous tab' })

-- Overwrite ' goto mark with ` goto mark
set('n', "'", '`', {})

-- Toggles
-- Cursor line
set('n', '<leader>tcl', '<CMD>setlocal cursorline!', { desc = 'Toggle Cursor Line (Local)' }) -- Cursor line
set('n', '<leader>Tcl', '<CMD>set cursorline!', { desc = 'Toggle Cursor Line (Global)' })
-- Cursor column
set('n', '<leader>tcc', '<CMD>setlocal cursorcolumn!', { desc = 'Toggle Cursor Column (Local)' })
set('n', '<leader>Tcc', '<CMD>set cursorcolumn!', { desc = 'Toggle Cursor Column (global)' })
-- Color column
set('n', '<leader>tCc', function()
  if vim.o.colorcolumn == '' then
    vim.o.colorcolumn = '80'
  else
    vim.o.colorcolumn = ''
  end
end, { desc = 'Toggle color column' })
-- Diagnostics
set('n', '<leader>td', function()
  if vim.diagnostic.is_enabled() then
    vim.diagnostic.enable(false)
  else
    vim.diagnostic.enable(true)
  end
end, { desc = 'Toggle diagnostics' })
-- Spell
set('n', '<leader>ts', '<CMD>setlocal spell! spell?', { desc = 'Toggle Spell (Local)' }) -- Spell
-- Fold column
set('n', '<leader>tfc', function()
  local cur_val = vim.wo.foldcolumn
  if cur_val == '0' then
    vim.wo.foldcolumn = 'auto'
  else
    vim.wo.foldcolumn = '0'
  end
end, { desc = 'Toggle foldcolumn' })
-- Statusline
set('n', '<leader>tS', require('kade.statusline-toggle').toggle, { desc = 'Toggle statusline' })

-- Better indenting with '<' and '>'
set('x', '<', '<gv', {})
set('x', '>', '>gv', {})

-- Treesitter Inspect
set('n', '<leader>i', '<CMD>Inspect<CR>', { desc = 'Treesitter Inspect' })

-- Override ga with characterize
set('n', 'ga', '<CMD>Characterize<CR>', { desc = 'Characterize' })

-- Source highlights
vim.keymap.set('n', '<leader>sh', function()
  local config = vim.fn.stdpath 'config'
  dofile(config .. '/plugin/highlights.lua')
  local ft = vim.bo.filetype
  local ft_path = config .. '/after/ftplugin/' .. ft .. '.lua'
  local f = io.open(ft_path, 'r')
  if f == nil then
    return nil
  end
  dofile(config .. '/after/ftplugin/' .. ft .. '.lua')
end, { desc = 'Source highlights' })
