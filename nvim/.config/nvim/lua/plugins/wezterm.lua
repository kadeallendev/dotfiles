-- Integrations with WezTerm

-- Disable for windows
local utils = require 'kade.utils'

if utils.is_mac() then
  return {
    'willothy/wezterm.nvim',
    config = true,
  }
end

return {}
