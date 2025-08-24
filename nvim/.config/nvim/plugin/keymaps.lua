local set = vim.keymap.set

-- Set leader key to space
vim.g.mapleader = ' '

------ PERSONAL MODULES ------

-- Encrypt
local encrypt = require('kade.encrypt')
set('n', '<leader>e', encrypt.encrypt_buffer, { desc = 'GPG encrypt buffer' })
set('n', '<leader>E', encrypt.decrypt_buffer, { desc = 'GPG decrypt buffer' })

-- Statusline toggle
-- NOTE: commented out to use toggle spellwarn instead.
-- | Use :TStatus to toggle
-- set('n', '<leader>tS', require('kade.statusline-toggle').toggle, { desc = 'Toggle statusline' })


------ KEYMAPS ------

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

-- Better indenting with '<' and '>'
set('x', '<', '<gv', {})
set('x', '>', '>gv', {})

-- Treesitter Inspect
set('n', '<leader>i', '<CMD>Inspect<CR>', { desc = 'Treesitter Inspect' })

-- Override ga with characterize
set('n', 'ga', '<CMD>Characterize<CR>', { desc = 'Characterize' })

-- Highlights
-- Clear highlights
set('n', '<leader>hc', '<CMD>hi clear<CR>', { desc = 'Clear highlights' })
-- Set highlights
set('n', '<leader>hs', function()
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
-- Deprectated warning
set('n', '<leader>sh', function()
  vim.notify('Keymap deprecated. Use <leader>hs', vim.log.levels.WARN)
end)

-- Correct spelling mistake with <leader>C
vim.keymap.set('n', '<leader>C', '1z=', { desc = "Accept first spelling suggestion" })
