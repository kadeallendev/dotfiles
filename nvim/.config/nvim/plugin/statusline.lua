local git = require 'kade.git'
local jira = require 'kade.jira'

-- Statusline configuration
function StatusLine()
  -- Get the git branch
  -- If there is a JIRA ticket in branch name use that instead
  local branch = git.get_branch()
  local jira_ticket = jira.get_ticket()
  if jira_ticket then
    branch = '[ ' .. jira_ticket .. ']'
  elseif branch then
    branch = '[󰘬 ' .. branch .. ']'
  else
    branch = ''
  end

  return table.concat {
    '%<',   -- Where to truncate
    '%f',   -- Filename relative to cwd
    ' ',
    '%h',   -- Help flag
    '%w',   -- Preview window flag
    '%m',   -- Modified flag
    '%r',   -- Readonly flag
    '%=',   -- Separation flag
    '%a',   -- Arglist flag
    ' ',
    '%y',   -- Filetype flag
    branch, -- Git branch or Jira ticket
    ' ',
    -- BEGIN cursor pos group
    '%10.(',   -- Left justified item group with 14 min width
    '%l,%c%V', -- Line number, Column number, Virtual col number
    '%)',      -- End item group
    -- END cursor pos group
  }
end

vim.opt.statusline = '%!v:lua.StatusLine()'

-- Default
-- set statusline=%<%f\ %h%w%m%r%=%-14.(%l,%c%V%)\ %P
