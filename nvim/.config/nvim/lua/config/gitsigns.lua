require('gitsigns').setup {
  -- signs = {
  --   add = { text = '+' },
  --   change = { text = '~' },
  --   delete = { text = '_' },
  --   topdelete = { text = '‾' },
  --   changedelete = { text = '~' },
  -- },
}


-- Hunk movement
vim.keymap.set('n', ']h', '<CMD>Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
vim.keymap.set('n', '[h', '<CMD>Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })

-- Stage hunk
vim.keymap.set('n', '<leader>gh', '<CMD>Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
