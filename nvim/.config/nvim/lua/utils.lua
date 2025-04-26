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

M.pt_vault_dir = function()
  local vault_dir = '/mnt/c/users/kade.allen/OneDrive - PartsTrader/PT-Vault'
  if M.is_windows() then
    vault_dir = 'C:/Users/kade.allen/OneDrive - PartsTrader/PT-Vault'
  elseif M.is_mac() then
    vault_dir = '/Users/kadeallen/PT-Vault'
  end

  return vault_dir
end

M.get_branch_name = function()
  local handle = io.popen 'git rev-parse --abbrev-ref HEAD 2> /dev/null'
  if handle == nil then
    print 'ERROR: unable to get branch name'
    return
  end
  local branch_name = handle:read('*a'):gsub('%s+', '')
  handle:close()
  return branch_name
end

M.jira_prefix_pat = '^f?e?a?t?u?r?e?/?([A-Za-z]+%-%d+)'
-- M.jira_prefix_pat = '^(feature/)?[A-Za-z]+%-%d+'

M.get_branch_prefix = function()
  local branch_name = M.get_branch_name()
  if branch_name == nil then
    return
  end
  return branch_name:match(M.jira_prefix_pat)
end

return M
