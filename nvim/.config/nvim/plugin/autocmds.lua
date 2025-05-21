local utils = require 'utils'

--------------------------------------------------------
-- Inserts the current git branch into the 'b' register.
-- Defaults to 'main' if not in git repo.
--------------------------------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local branch = utils.get_git_branch()
    if branch then
      vim.fn.setreg('b', branch)
    end
  end,
})

----------------------------------------------
-- Inserts the JIRA ticket to the 't' register
----------------------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local ticket = utils.get_jira_ticket()
    if ticket == nil then
      return nil
    end

    vim.fn.setreg('t', ticket)
  end,
})

-----------------------------------------------------
-- Inserts a link to the current branch's JIRA ticket
-- into the 'j' register
-----------------------------------------------------
vim.api.nvim_create_autocmd('VimEnter', {
  callback = function()
    local ticket = utils.get_jira_ticket()
    if ticket == nil then
      return nil
    end

    local jira_link = 'https://partstrader.atlassian.net/browse/' .. ticket
    vim.fn.setreg('j', jira_link)
  end,
})
