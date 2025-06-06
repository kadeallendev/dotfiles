-- Formatting
return {
  'stevearc/conform.nvim',
  event = 'BufWritePre',
  cmd = { 'ConformInfo' },
  config = function()
    require 'plugins.config.cfg-conform'
  end,
}
