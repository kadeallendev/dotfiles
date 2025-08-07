local utils = require 'kade.utils'

-- Disable automatic comment on enter
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  command = 'setlocal formatoptions-=cro',
})

-- Create an augroup for Git and JIRA related autocommands
local git_jira_group = vim.api.nvim_create_augroup('GitJiraIntegration', { clear = true })

-------------------------------------------------------------------
-- Loads the git branch as well as JIRA ticket and link into global
-- variables and registers
-------------------------------------------------------------------
local function update_git_and_jira_info()
  -- Get branch, ticket, and link
  local branch = utils.get_git_branch() or ''
  local ticket = utils.get_jira_ticket() or ''
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
  vim.fn.setreg('j', link)
end

-- Update git and jira on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  group = git_jira_group,
  desc = 'Initialize Git and JIRA globals and registers',
  callback = update_git_and_jira_info,
})

-- Update git and jira on git repo changing
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveChanged',
  group = git_jira_group,
  desc = 'Reload Git and JIRA globals and registers',
  callback = update_git_and_jira_info,
})

----------------------------------------
-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
----------------------------------------
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-------------------------------------
-- Detect docker-compose.yml filetype
-------------------------------------
vim.api.nvim_create_autocmd({ 'BufRead', 'BufNewFile' }, {
  desc = "Detect docker compose filetype",
  pattern = { "docker-compose.yaml", "docker-compose.yml", "compose.yaml", "compose.yml" },
  callback = function()
    vim.bo.filetype = "yaml.docker-compose"
  end
})
