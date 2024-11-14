-- Integrations with WezTerm

-- Disable for windows
local utils = require 'utils'
if utils.is_windows() then
  return {}
end

return {
  'willothy/wezterm.nvim',
  config = true,
}
