local neogit = require 'neogit'
neogit.setup {}

vim.keymap.set('n', 'gs', '<CMD>Neogit<CR>', { desc = 'Neogit' })
