local utils = require 'utils'

-- Git related shit

-- Neogit status
vim.keymap.set('n', '<leader>gn', '<CMD>Neogit<CR>', { noremap = true, silent = true, desc = 'Neogit' })

local gitsigns = require 'gitsigns'

-- Hunk movement ---

-- Next hunk
vim.keymap.set('n', ']h', function()
  gitsigns.nav_hunk 'next'
end, { desc = 'Next hunk', noremap = true, silent = true })
-- Previous hunk
vim.keymap.set('n', '[h', function()
  gitsigns.nav_hunk 'prev'
end, { desc = 'Previous hunk', noremap = true, silent = true })
-- First hunk
vim.keymap.set('n', '[H', function()
  gitsigns.nav_hunk 'first'
end, { desc = 'First hunk', noremap = true, silent = true })
-- Last hunk
vim.keymap.set('n', ']H', function()
  gitsigns.nav_hunk 'last'
end, { desc = 'Last hunk', noremap = true, silent = true })

-- Stage hunk
vim.keymap.set('n', '<leader>gh', gitsigns.stage_hunk, { noremap = true, silent = true, desc = 'Stage hunk' })

-- Stage buffer
vim.keymap.set('n', '<leader>gs', gitsigns.stage_buffer, { noremap = true, silent = true, desc = 'Stage buffer' })
vim.keymap.set('n', '<leader>ga', gitsigns.stage_buffer, { desc = 'Add buffer to index (stage)' })
-- Unstage buffer
vim.keymap.set('n', '<leader>gS', gitsigns.reset_buffer_index, { noremap = true, silent = true, desc = 'Unstage buffer' })

-- Diff current file
vim.keymap.set('n', '<leader>gdt', gitsigns.diffthis, { noremap = true, silent = true, desc = 'Gitsigns diffthis' })

-- Blame current line
vim.keymap.set('n', '<leader>gbl', function()
  gitsigns.blame_line { full = true }
end, { noremap = true, silent = true, desc = 'Gitsigns blame line' })

-- Blame all lines
vim.keymap.set('n', '<leader>gba', gitsigns.blame, { noremap = true, silent = true, desc = 'Gitsigns blame all lines' })

-- Preview hunk
vim.keymap.set('n', '<leader>gph', gitsigns.preview_hunk_inline, { noremap = true, silent = true, desc = 'Gitsigns preview hunk inline' })

-- Toggle line highlight a.k.a. preview all lines
vim.keymap.set('n', '<leader>gpa', gitsigns.toggle_linehl, { noremap = true, silent = true, desc = 'Gitsigns toggle line highlight' })

-- Reset hunk
vim.keymap.set('n', '<leader>grh', gitsigns.reset_hunk, { noremap = true, silent = true, desc = 'Gitsigns reset hunk' })

-- Commit with the branch jira prefix prefixed to commit message
local function commit()
  local prompt = 'Commit msg: '
  -- Get branch prefix
  local branch_prefix = utils.get_jira_ticket()
  if branch_prefix ~= nil then
    prompt = 'Commit msg [' .. branch_prefix .. ']: '
  end

  -- Prompt user
  vim.ui.input({ prompt = prompt }, function(input)
    -- Check if a message was provided
    if not input or #input == 0 then
      print 'Commit message was not provided'
      return
    end

    -- If commit message contains another JIRA prefix, don't prepend branch prefix
    if input:match(utils.jira_prefix_pat) ~= nil then
      vim.cmd('G commit -m "' .. input .. '"')
      return
    end

    -- Commit with jira prefix
    local msg = input
    -- Prepend the branch prefix if it exists
    if branch_prefix ~= nil then
      msg = branch_prefix .. ' ' .. msg
    end
    vim.cmd('G commit -m "' .. msg .. '"')
  end)
end

-- Commit
vim.keymap.set('n', '<leader>gc', commit, { noremap = true, silent = true, desc = 'Commit with branch prefix' })
-- Commit with message
vim.keymap.set('n', '<leader>gC', function()
  -- Open commit window
  vim.cmd 'G commit --verbose'

  -- Wait for commit buffer to open
  vim.defer_fn(function()
    -- Paste JIRA ticket from 't' reg
    local content = vim.fn.getreg 't' .. ' '
    local lines = {}
    for line in string.gmatch(content, '[^\n]+') do
      table.insert(lines, line)
    end
    vim.api.nvim_put(lines, '', false, true)

    -- Enter insert mode
    vim.cmd 'startinsert!'
  end, 100)
end, { noremap = true, silent = true, desc = 'Commit with long message' })
