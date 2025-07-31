-- Powershell development

-- Only for windows
if require('kade.utils').is_windows() then
  return {
    {
      'TheLeoP/powershell.nvim',
      opts = {
        bundle_path = vim.fn.stdpath 'data' .. '\\mason\\packages\\powershell-editor-services',
      },
    },
  }
else
  return {}
end
