-- Obsidian integration, not for windows
local utils = require 'kade.utils'

-- Disable for windows
if utils.is_mac() then
  return {
    {
      'epwalsh/obsidian.nvim',
      version = '*',
      dependencies = {
        'nvim-lua/plenary.nvim',
      },
      config = function()
        require 'plugins.config.cfg-obsidian'
      end,
    },
  }
else
  return {}
end
