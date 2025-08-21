local git = require('kade.git')

--- Module for working with JIRA
local M = {
  --- The lua regex pattern for a branch with JIRA ticket
  branch_pattern = '^f?e?a?t?u?r?e?/?([A-Za-z]+%-%d+)'
}

--- Gets the JIRA ticket from the git branch
---@return string|nil # The current JIRA ticket, or nil if no ticket in branch or no git repo
M.get_ticket = function()
  local branch_name = git.get_branch()
  if branch_name == nil then
    return nil
  end
  return branch_name:match(M.branch_pattern)
end

--- Updates the registers and variables for Jira and Git info
M.update = function()
  -- Get branch, ticket, and link
  local branch = git.get_branch() or ''
  local ticket = M.get_ticket() or ''
  local link = ''
  if ticket ~= '' then
    link = string.format('- [%s](https://partstrader.atlassian.net/browse/%s)', ticket, ticket)
  end

  -- Set global variables
  vim.g.gitbranch = branch
  vim.g.jiraticket = ticket

  -- Set registers
  vim.fn.setreg('b', branch)
  vim.fn.setreg('t', ticket)
  if vim.bo.filetype == "markdown.git-pr-body" then
    vim.fn.setreg('j', link)
  end
end

return M
