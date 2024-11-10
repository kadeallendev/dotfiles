--[[
-- Setup initial configuration,
-- Mainly downloads and executes lazy.nvim
]]

-- Set leader key
vim.g.mapleader = ' '

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({ import = 'plugins' }, {
  change_detection = {
    notify = false,
  },
  performance = {
    disabled_plugins = {
      'gzip', -- Editing compressed files
      'matchit', -- Better '%' movement, replaced by vim-matchup plugin
      'matchparen', -- Same as matchit
      'netrwPlugin', -- We don't use netrw
      'tarPlugin', -- Editing tar shit
      -- 'tohtml', -- Converts buffer to HTML
      -- 'tutor', -- Vim Tutor
      'zipPlugin', -- Zip files
    },
  },
})

vim.cmd [[colorscheme cyberdream]]
