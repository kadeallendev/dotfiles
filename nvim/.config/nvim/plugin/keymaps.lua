local set = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = ' '

-- Diagnostic keymaps
set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic' })

-- Quickfix keymaps
set('n', '[q', '<CMD>cprev<CR>', { desc = 'Go to previous entry in quickfix list' })
set('n', ']q', '<CMD>cnext<CR>', { desc = 'Go to next entry in quickfix list' })

-- Better scrolling
set('n', '<C-d>', '<C-d>zz')
set('n', '<C-u>', '<C-u>zz')

-- Move to top and bottom
set('n', 'zk', 'z<CR>', { desc = 'Move to top' })
set('n', 'zj', 'zb', { desc = 'Move to bottom' })

-- Better pasting and deleting
set('x', '<leader>p', [["_dP]])
set('x', '<leader>d', [["_d]])

-- Tab movement with tab key
set('n', '<TAB>', '<CMD>tabn<CR>', { desc = 'Next tab' })
set('n', '<S-TAB>', '<CMD>tabp<CR>', { desc = 'Previous tab' })
