--- Git related functions
---@class Git
local M = {}

--- Gets the current git branch
---@return string|nil # The current git branch name, or nil if not in a git repository or if git is not installed
M.get_branch = function()
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

return M
