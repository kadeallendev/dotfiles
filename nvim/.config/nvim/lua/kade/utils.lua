--- Utility functions
local M = {}

--- Checks if the current operating system is Windows
--- @return boolean # Returns true if running on Windows, false otherwise
M.is_windows = function()
  ---@diagnostic disable-next-line: undefined-field
  return vim.uv.os_uname().sysname == 'Windows_NT'
end

--- Checks if the current operating system is Linux
--- @return boolean # Returns true if running on Linux, false otherwise
M.is_linux = function()
  ---@diagnostic disable-next-line: undefined-field
  return vim.uv.os_uname().sysname == 'Linux'
end

--- Checks if the current operating system is MacOS
---@return boolean # Returns true if running on MacOS, false otherwise
M.is_mac = function()
  ---@diagnostic disable-next-line: undefined-field
  return vim.uv.os_uname().sysname == 'Darwin'
end

--- Checks if the current operating system is MacOS
---@return boolean # Returns true if running on MacOS, false otherwise
M.is_unix = function()
  return M.is_mac() or M.is_linux()
end

--- Gets the path on PT machine to PT vault
--- @return string # The path to my PT vault
M.pt_vault_dir = function()
  local vault_dir = '/mnt/c/users/kade.allen/OneDrive - PartsTrader/PT-Vault'
  if M.is_windows() then
    vault_dir = 'C:/Users/kade.allen/OneDrive - PartsTrader/PT-Vault'
  elseif M.is_mac() then
    vault_dir = '/Users/kadeallen/PT-Vault'
  end

  return vault_dir
end

return M
