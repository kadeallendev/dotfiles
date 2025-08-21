-------------------------------------
-- Disable automatic comment on enter
-------------------------------------
vim.api.nvim_create_autocmd('FileType', {
  pattern = '*',
  command = 'setlocal formatoptions-=cro',
})

-------------------------------------
--- Jira Integration
-------------------------------------

local jira = require('kade.jira')

-- Create an augroup for Git and JIRA related autocommands
local git_jira_group = vim.api.nvim_create_augroup('GitJiraIntegration', { clear = true })

-- Update git and jira on VimEnter
vim.api.nvim_create_autocmd('VimEnter', {
  group = git_jira_group,
  desc = 'Initialize Git and JIRA globals and registers',
  callback = jira.update,
})

-- Update git and jira on git repo changing
vim.api.nvim_create_autocmd('User', {
  pattern = 'FugitiveChanged',
  group = git_jira_group,
  desc = 'Reload Git and JIRA globals and registers',
  callback = jira.update,
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
