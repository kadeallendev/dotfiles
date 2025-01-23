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

-- Gitsigns toggle_current_line_blame
-- Gitsigns toggle_linehl

-- Diff current file
vim.keymap.set('n', '<leader>gdt', gitsigns.diffthis, { noremap = true, silent = true, desc = 'Gitsigns diffthis' })

-- Blame current line
vim.keymap.set('n', '<leader>gbl', gitsigns.blame_line, { noremap = true, silent = true, desc = 'Gitsigns blame line' })

-- Blame all lines
vim.keymap.set('n', '<leader>gba', gitsigns.blame, { noremap = true, silent = true, desc = 'Gitsigns blame all lines' })

-- Preview hunk
vim.keymap.set('n', '<leader>gph', gitsigns.preview_hunk, { noremap = true, silent = true, desc = 'Gitsigns preview hunk' })


-- Commit with branch prefix
local jira_prefix_pat = '^[A-Za-z]+%-%d+'
local function get_branch_prefix()
  local handle = io.popen 'git rev-parse --abbrev-ref HEAD 2> /dev/null'
  if handle == nil then
    print 'ERROR: unable to get branch name'
    return
  end
  local branch_name = handle:read('*a'):gsub('%s+', '') -- Remove trailing whitespace
  handle:close()
  return branch_name:match(jira_prefix_pat)
end

-- Commit with the branch jira prefix prefixed to commit message
local function commit()
  local prompt = 'Commit msg: '
  -- Get branch prefix
  local branch_prefix = get_branch_prefix()
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
    if input:match(jira_prefix_pat) ~= nil then
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
vim.keymap.set('n', '<leader>gC', '<CMD>G commit<CR>', { noremap = true, silent = true, desc = 'Commit with long message' })
