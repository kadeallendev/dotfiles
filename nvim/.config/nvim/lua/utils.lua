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

M.get_git_branch = function()
  -- Check if git executable exists
  local git_exists = vim.fn.executable 'git'
  if git_exists == 0 then
    print 'ERROR: git executable does not exist'
    return nil
  end

  -- Check if inside git repo
  local success, is_git_output = pcall(function()
    return vim.fn.system 'git rev-parse --is-inside-work-tree 2>/dev/null'
  end)
  if not (success and is_git_output:match 'true') then
    -- If not inside git repo, set branch to 'main'
    return 'main'
  end

  -- Get branch name
  local branch_success, branch = pcall(function()
    return vim.fn.trim(vim.fn.system 'git branch --show-current 2>/dev/null')
  end)
  if not branch_success or branch == '' then
    print 'ERROR: unable to get branch name'
    return nil
  end

  -- Remove whitespace from branch and return
  return branch:gsub('%s+', '')
end

M.jira_prefix_pat = '^f?e?a?t?u?r?e?/?([A-Za-z]+%-%d+)'
-- M.jira_prefix_pat = '^(feature/)?[A-Za-z]+%-%d+'

M.get_jira_ticket = function()
  local branch_name = M.get_git_branch()
  if branch_name == nil then
    return
  end
  return branch_name:match(M.jira_prefix_pat)
end

return M
