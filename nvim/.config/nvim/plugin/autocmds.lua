local utils = require 'utils'

--------------------------------------------------------
-- Inserts the current git branch into the 'b' register.
-- Defaults to 'main' if not in git repo.
--------------------------------------------------------
local function set_reg_git_branch()
  local branch = utils.get_git_branch()
  if branch then
    vim.fn.setreg('b', branch)
  end
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = set_reg_git_branch,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveChanged',
  callback = set_reg_git_branch,
})

----------------------------------------------
-- Inserts the JIRA ticket to the 't' register
----------------------------------------------
local function set_reg_jira_ticket()
  local ticket = utils.get_jira_ticket()
  if ticket == nil then
    return nil
  end

  vim.fn.setreg('t', ticket)
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = set_reg_jira_ticket,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveChanged',
  callback = set_reg_jira_ticket,
})

-----------------------------------------------------
-- Inserts a link to the current branch's JIRA ticket
-- into the 'j' register
-----------------------------------------------------
local function set_reg_jira_link()
  local ticket = utils.get_jira_ticket()
  if ticket == nil then
    return nil
  end

  local jira_link = '- [' .. ticket .. '](https://partstrader.atlassian.net/browse/' .. ticket .. ')'
  vim.fn.setreg('j', jira_link)
end

vim.api.nvim_create_autocmd('VimEnter', {
  callback = set_reg_jira_link,
})
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveChanged',
  callback = set_reg_jira_link,
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
