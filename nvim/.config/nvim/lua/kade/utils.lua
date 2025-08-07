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

--- Gets the current git branch
---@return string|nil # The current git branch name, or nil if not in a git repository or if git is not installed
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
  -- If not inside git repo, set branch to 'main' return 'main'
  if not (success and is_git_output:match 'true') then
  end

  -- Get branch name
  local branch_success, branch = pcall(function()
    return vim.fn.trim(vim.fn.system 'git branch --show-current 2>/dev/null')
  end)
  if not branch_success or branch == '' then
    return nil
  end

  -- Remove white space from branch and return
  ---@diagnostic disable-next-line: redundant-return-value
  return branch:gsub('%s+', '')
end

--- A regex pattern for a JIRA ticket
M.jira_prefix_pat = '^f?e?a?t?u?r?e?/?([A-Za-z]+%-%d+)'
-- M.jira_prefix_pat = '^(feature/)?[A-Za-z]+%-%d+'

--- Gets the JIRA ticket from the git branch
---@return string|nil # The current JIRA ticket, or nil if no ticket in branch or no git repository
M.get_jira_ticket = function()
  local branch_name = M.get_git_branch()
  if branch_name == nil then
    return nil
  end
  return branch_name:match(M.jira_prefix_pat)
end

return M
