-- Git related shit

-- Hunk movement
vim.keymap.set('n', ']h', '<CMD>Gitsigns next_hunk<CR>', { desc = 'Next hunk' })
vim.keymap.set('n', '[h', '<CMD>Gitsigns prev_hunk<CR>', { desc = 'Previous hunk' })

-- Stage hunk
vim.keymap.set('n', '<leader>gh', '<CMD>Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })

-- Stage current buffer and commit, prompting for message
local function stage_and_commit()
  -- Stage buffer
  vim.cmd 'G stage %'

  -- Prompt for commit message
  vim.ui.input({ prompt = 'Commit msg: ' }, function(input)
    if input then
      -- Create git commit
      vim.cmd('G commit -m "' .. input .. '"')
    else
      print 'Commit message was not provided'
    end
  end)
end

vim.keymap.set('n', '<leader>gc', stage_and_commit, { noremap = true, silent = true, desc = 'Stage current file and commit' })
