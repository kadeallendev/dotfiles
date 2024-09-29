require('obsidian').setup {
  workspaces = {
    {
      name = 'vault',
      path = '~/Documents/vault/',
    },
  },
  completion = {
    nvim_cmp = true,
    min_chars = 2,
  },
  daily_notes = {
    folder = 'daily',
    date_format = '%Y-%m-%d',
    alias_format = '%A %d %B %Y',
    default_tags = { 'daily-notes' },
  },
  open_app_foreground = true,
  templates = {
    folder = 'templates',
    date_format = '%Y-%m-%d',
    time_format = '%H:%M',
  },
  new_notes_location = 'current_dir',
  preferred_link_style = 'markdown',
  ui = {
    enable = false,
    -- checkboxes = {
    --   [' '] = { char = '☐', hl_group = 'ObsidianTodo' },
    --   ['x'] = { char = '✔', hl_group = 'ObsidianDone' },
    -- },
    -- bullets = {
    --   char = '-',
    --   hl_group = 'ObsidianBullet',
    -- },
  },
  attachments = {
    img_folder = 'assets',
  },
  mappings = {
    ['<cr>'] = {
      action = function()
        return '<CMD>ObsidianFollowLink<CR>'
      end,
      opts = { buffer = true, expr = true },
    },
    ['<leader>ch'] = {
      action = function()
        return require('obsidian').util.toggle_checkbox()
      end,
      opts = { buffer = true },
    },
  },
  note_id_func = function(title)
    if title ~= nil then
      -- If a title is given, transform
      return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
    else
      return tostring(os.time())
    end
  end,
}

-- Grep in vault
vim.keymap.set('n', '<leader>os', '<CMD>ObsidianSearch<CR>', { desc = 'Grep search in notes in vault' })
vim.keymap.set('n', '<leader>vg', '<cmd>ObsidianSearch<CR>', { desc = 'Grep search in vault' })

-- Search notes
vim.keymap.set('n', '<leader>vq', '<CMD>ObsidianQuickSwitch<CR>', { desc = 'Quick search notes in vault' })
vim.keymap.set('n', '<leader>v.', '<CMD>ObsidianQuickSwitch<CR>', { desc = 'Quick search notes in vault' })

-- Open obsidian
vim.keymap.set('n', '<leader>oO', '<CMD>ObsidianOpen<CR>', { desc = 'Open note in obsidian' })

-- Create link to selection
vim.keymap.set('v', '<leader>ol', '<CMD>ObsidianLink<CR>', { desc = 'Create link' })

-- Rename note
vim.keymap.set('n', '<leader>or', '<CMD>ObsidianRename<CR>', { desc = 'Rename note' })

-- Insert template
vim.keymap.set('n', '<leader>vt', '<CMD>ObsidianTemplate<CR>', { desc = 'Insert template' })

-- Create note
vim.keymap.set('n', '<leader>on', '<CMD>ObsidianNew<CR>', { desc = 'Create new obsidian note' })

-- Create new note from template
vim.keymap.set('n', '<leader>oN', '<CMD>ObsidianNewFromTemplate<CR>', { desc = 'Create new note from template' })

-- View tags
vim.keymap.set('n', '<leader>o#', '<CMD>ObsidianTag<CR>', { desc = 'View obsidian tags' })

-- Create note for today
vim.keymap.set('n', '<leader>od', '<CMD>ObsidianToday<CR>', { desc = 'Open daily note for today' })

-- Search through daily notes
vim.keymap.set('n', '<leader>oD', '<CMD>ObsidianDailies<CR>', { desc = 'Search daily notes' })
