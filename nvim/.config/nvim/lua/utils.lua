local M = {}

M.is_windows = function()
  return vim.loop.os_uname().sysname == 'Windows_NT'
end

M.is_linux = function()
  return vim.loop.os_uname().sysname == 'Linux'
end

M.is_mac = function()
  return vim.loop.os_uname().sysname == 'Darwin'
end

M.is_unix = function()
  return M.is_mac() or M.is_linux()
end

M.config_path = function()
  local home = vim.fn.expand '~'

  if M.is_windows() then
    return home .. '/AppData/Local'
  end

  return home .. '/.config'
end

M.nvim_data_path = function()
  local home = vim.fn.expand '~'

  if M.is_windows() then
    return home .. '/AppData/Local/nvim-data'
  end

  return home .. '/.local/share/nvim'
end

return M
