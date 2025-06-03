--[[
-- Setup initial configuration,
-- Mainly downloads and executes lazy.nvim
]]

-- Set leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- bootstrap lazy
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { 'Failed to clone lazy.nvim:\n', 'ErrorMsg' },
      { out, 'WarningMsg' },
      { '\nPress any key to exit...' },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy
require('lazy').setup({ import = 'plugins' }, {
  change_detection = {
    notify = false,
  },
  performance = {
    disabled_plugins = {
      'gzip',
      'matchit',
      'matchparen',
      'tarPlugin',
      'zipPlugin',
    },
  },
})

vim.cmd [[colorscheme default]]

-- Setup VSCode
if vim.g.vscode then
  require 'vscode'
end
