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
set('n', '<leader>tcl', '<CMD>Tcl<CR>', { desc = 'Toggle Cursor Line' }) -- Cursor line
set('n', '<leader>tcc', '<CMD>Tcc<CR>', { desc = 'Toggle color column' }) -- Color column
set('n', '<leader>td', '<CMD>Tdiag<CR>', { desc = 'Toggle diagnostics' }) -- Diagnostics
set('n', '<leader>ts', '<CMD>Tspell<CR>', { desc = 'Toggle spell' }) -- Spell
set('n', '<leader>tfc', '<CMD>Tfc<CR>', { desc = 'Toggle foldcolumn' }) -- Fold column
set('n', '<leader>tS', '<CMD>Tsl<CR>', { desc = 'Toggle statusline' }) -- Statusline

-- Better indenting with '<' and '>'
set('x', '<', '<gv', {})
set('x', '>', '>gv', {})

-- Treesitter Inspect
set('n', '<leader>i', '<CMD>Inspect<CR>', { desc = 'Treesitter Inspect' })

-- Override ga with characterize
set('n', 'ga', '<CMD>Characterize<CR>', { desc = 'Characterize' })

-- Source highlights
vim.keymap.set('n', '<leader>sh', '<CMD>source ~/.config/nvim/plugin/highlights.lua<CR>', { desc = 'Source highlights' })
