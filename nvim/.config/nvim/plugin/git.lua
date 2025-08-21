local jira = require 'kade.jira'

-- The format str for the ticket in commit message.
-- A nil value signifies to ticket to be added.
vim.g.commitfmt = '%s '

-- Git related shit

-- Neogit status
vim.keymap.set('n', '<leader>gn', '<CMD>Neogit<CR>', { silent = true, desc = 'Neogit' })

local gitsigns = require 'gitsigns'

-- Hunk movement ---

-- Next hunk
vim.keymap.set('n', ']h', function()
  gitsigns.nav_hunk 'next'
end, { desc = 'Next hunk', silent = true })
-- Previous hunk
vim.keymap.set('n', '[h', function()
  gitsigns.nav_hunk 'prev'
end, { desc = 'Previous hunk', silent = true })
-- First hunk
vim.keymap.set('n', '[H', function()
  gitsigns.nav_hunk 'first'
end, { desc = 'First hunk', silent = true })
-- Last hunk
vim.keymap.set('n', ']H', function()
  gitsigns.nav_hunk 'last'
end, { desc = 'Last hunk', silent = true })

--- Conflict management --

-- Next and previous conflict
local pat = '^\\(<<<<<<<\\|=======\\|>>>>>>>\\)'
vim.keymap.set({ 'n', 'v', 'o' }, ']x', function()
  local count = vim.v.count1
  for _ = 1, count do
    local res = vim.fn.search(pat)
    if res == 0 then
      vim.notify('No more conflict markers', vim.log.levels.WARN)
      break
    end
  end
  vim.cmd 'nohlsearch'
end, { desc = 'Go to next conflict' })
vim.keymap.set({ 'n', 'v', 'o' }, '[x', function()
  local count = vim.v.count1
  for _ = 1, count do
    local res = vim.fn.search(pat, 'b')
    if res == 0 then
      vim.notify('No more conflict markers', vim.log.levels.WARN)
      break
    end
  end
  vim.cmd 'nohlsearch'
end, { desc = 'Go to previous conflict' })

-- Load conflicts in current buffer into location list
local function find_conflicts_buffer()
  local bufnr = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr, 0, -1, false)
  local locations = {}

  for i, line in ipairs(lines) do
    if line:match '^<<<<<<< ' then
      table.insert(locations, {
        bufnr = bufnr,
        lnum = i,
        col = 1,
        text = 'Conflict: ' .. line:sub(9),
      })
    end
  end

  vim.fn.setloclist(0, locations, 'r')

  if #locations > 0 then
    vim.cmd 'lopen'
    print('Found ' .. #locations .. ' conflicts')
  else
    print 'No merge conflicts found'
  end
end
vim.keymap.set('n', '<leader>gfc', find_conflicts_buffer, { desc = 'Find conflicts' })

-- Load conflicts in directory to quickfix list
local function find_conflicts_all()
  local cmd = 'silent grep "^<<<<<<< " .'
  vim.cmd(cmd)

  local qf_list = vim.fn.getqflist()
  if #qf_list > 0 then
    vim.cmd 'copen'
    print('Found ' .. #qf_list .. ' conflicts')
  else
    print 'No merge conflicts found'
  end
end
vim.keymap.set('n', '<leader>gfC', find_conflicts_all, { desc = 'Find conflicts in directory' })

-- Stage hunk
vim.keymap.set('n', '<leader>gh', gitsigns.stage_hunk, { silent = true, desc = 'Stage hunk' })

-- Stage buffer
vim.keymap.set('n', '<leader>gs', gitsigns.stage_buffer, { silent = true, desc = 'Stage buffer' })
vim.keymap.set('n', '<leader>ga', gitsigns.stage_buffer, { desc = 'Add buffer to index (stage)' })
-- Unstage buffer
vim.keymap.set('n', '<leader>gS', gitsigns.reset_buffer_index, { silent = true, desc = 'Unstage buffer' })

-- Diff current file
vim.keymap.set('n', '<leader>gdt', gitsigns.diffthis, { silent = true, desc = 'Gitsigns diffthis' })

-- Blame current line
vim.keymap.set('n', '<leader>gbl', gitsigns.blame_line, { desc = 'Gitsigns blame line' })
vim.keymap.set('n', '<leader>gbL', function() gitsigns.blame_line { full = true } end,
  { silent = true, desc = 'Gitsigns blame line with diff' })

-- Blame all lines
vim.keymap.set('n', '<leader>gba', gitsigns.blame, { silent = true, desc = 'Gitsigns blame all lines' })

-- Preview hunk
vim.keymap.set('n', '<leader>gph', gitsigns.preview_hunk_inline,
  { silent = true, desc = 'Gitsigns preview hunk inline' })

-- Toggle line highlight a.k.a. preview all lines
vim.keymap.set('n', '<leader>gpa', gitsigns.toggle_linehl,
  { silent = true, desc = 'Gitsigns toggle line highlight' })

-- Reset hunk
vim.keymap.set('n', '<leader>grh', gitsigns.reset_hunk, { silent = true, desc = 'Gitsigns reset hunk' })

-- Commit with the branch jira prefix prefixed to commit message
local function commit()
  local prompt = 'Commit msg: '
  -- Get branch prefix, only if it exists and commitfmt contains '%s'
  local branch_prefix = jira.get_ticket()
  if branch_prefix ~= nil and vim.g.commitfmt then
    prompt = 'Commit msg [' .. branch_prefix .. ']: '
  end

  -- Prompt user
  vim.ui.input({ prompt = prompt }, function(input)
    -- Check if a message was provided
    if not input or #input == 0 then
      print 'Commit message was not provided'
      return
    end

    -- If commit message contains another JIRA prefix or commitfmt is nil, don't prepend branch prefix
    if input:match(jira.branch_pattern) ~= nil or not vim.g.commitfmt then
      vim.cmd('G commit -m "' .. input .. '"')
      return
    end

    -- Commit with jira prefix
    local msg = input
    -- Prepend the branch prefix if it exists
    if branch_prefix ~= nil then
      local prefix_fmt = vim.g.commitfmt
      msg = string.format(prefix_fmt .. msg, branch_prefix)
    end
    vim.cmd('G commit -m "' .. msg .. '"')
  end)
end

-- Commit
vim.keymap.set('n', '<leader>gc', commit, { silent = true, desc = 'Commit with branch prefix' })
-- Commit with message
vim.keymap.set('n', '<leader>gC', function()
  -- Open commit window
  vim.cmd 'G commit --verbose'

  -- Wait for commit buffer to open
  vim.defer_fn(function()
    -- Paste JIRA ticket from 't' reg
    if vim.g.commitfmt then
      local ticket = jira.get_ticket()
      local content = string.format(vim.g.commitfmt .. ' ', ticket)
      local lines = {}
      ---@diagnostic disable-next-line: param-type-mismatch
      for line in string.gmatch(content, '[^\n]+') do
        table.insert(lines, line)
      end
      vim.api.nvim_put(lines, '', false, true)
    end

    -- Enter insert mode
    vim.cmd 'startinsert!'
  end, 100)
end, { silent = true, desc = 'Commit with long message' })
