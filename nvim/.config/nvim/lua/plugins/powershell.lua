-- Powershell development

local utils = require 'kade.utils'

if not utils.is_windows() then
  return {}
end

-- Only for windows

return {
  {
    'TheLeoP/powershell.nvim',
    opts = {
      bundle_path = vim.fn.stdpath 'data' .. '\\mason\\packages\\powershell-editor-services',
    },
  },
}
