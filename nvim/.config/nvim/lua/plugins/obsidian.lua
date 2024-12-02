-- Obsidian integration, not for windows
local utils = require 'utils'

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
        require 'config.obsidian'
      end,
    },
  }
end

return {}
