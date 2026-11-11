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

--- Loads all git conflicts in the repository into the quickfix list
M.load_conflicts = function()
  if vim.fn.executable 'git' == 0 then
    vim.notify('git executable does not exist', vim.log.levels.ERROR)
    return
  end

  -- Find the repo root
  local root = vim.system({ 'git', 'rev-parse', '--show-toplevel' }, { text = true }):wait()
  if root.code ~= 0 then
    vim.notify('Not inside a git repository', vim.log.levels.ERROR)
    return
  end
  local toplevel = vim.trim(root.stdout)

  -- Only search files git considers unmerged
  local unmerged = vim.system({ 'git', 'diff', '--name-only', '--diff-filter=U', '--relative' }, { text = true }):wait()
  local files = vim.split(vim.trim(unmerged.stdout or ''), '\n', { trimempty = true })
  if #files == 0 then
    vim.fn.setqflist({}, 'r')
    print 'No merge conflicts found'
    return
  end

  local items = {}
  for _, file in ipairs(files) do
    local path = vim.fs.joinpath(toplevel, file)
    local ok, lines = pcall(vim.fn.readfile, path)
    if ok then
      for i, line in ipairs(lines) do
        if line:match '^<<<<<<< ' or line == '<<<<<<<' then
          table.insert(items, {
            filename = path,
            lnum = i,
            col = 1,
            text = 'Conflict: ' .. line:sub(9),
          })
        end
      end
    end
  end

  vim.fn.setqflist({}, 'r', { title = 'Git conflicts', items = items })

  if #items > 0 then
    vim.cmd 'copen'
    print('Found ' .. #items .. ' conflicts')
  else
    print 'No merge conflicts found'
  end
end

return M
