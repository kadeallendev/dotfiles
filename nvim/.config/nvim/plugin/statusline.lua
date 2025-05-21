-- Status line configuration
-- Displays filename, modified status, and line number
-- The format string looks like this
-- '%<%h %f %m%=(%l,%c%V) %P'

local utils = require 'utils'

-- Set highlight for cwd
vim.api.nvim_set_hl(0, 'StatusLineCWD', { fg = '#5ea1ff', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineBranch', { fg = '#bd5eff', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineProtocol', { fg = '#5ea1ff', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineFile', { fg = '#ffffff', bold = true })

local protocols = { 'oil://', 'fugitive://', 'http://', 'octo://' }
local function is_protocol_file(bufname)
  for _, protocol in ipairs(protocols) do
    if bufname:sub(1, #protocol) == protocol then
      return true
    end
  end
end

function StatusLine()
  local cwd = vim.fn.getcwd()
  local home = vim.fn.expand '~'
  local full_fname = vim.fn.expand '%:p'
  local filetype = vim.bo.filetype
  local bufname = vim.fn.bufname()
  local branch_name = utils.get_jira_ticket()
  if branch_name == nil then
    branch_name = utils.get_git_branch()
  end

  if is_protocol_file(bufname) then
    local protocol = bufname:match '^[^:]+://'
    local filename = bufname:sub(#protocol + 1)
    return table.concat {
      '%#StatusLineProtocol#',
      protocol,
      '%#StatusLineFile#',
      filename,
      '%*',
    }
  end

  if cwd:find(home, 1, true) then
    cwd = cwd:gsub(home, '~')
  end

  if full_fname:find(home, 1, true) then
    full_fname = full_fname:gsub(home, '~')
  end

  local path_sep = '/'
  if vim.loop.os_uname().sysname == 'Windows_NT' then
    path_sep = '\\'
  end

  if full_fname:find(cwd, 1, true) then
    local relative_fname = full_fname:sub(#cwd + 2)
    if branch_name then
      relative_fname = relative_fname .. '%#StatusLineBranch#' .. ' ' .. branch_name
    end

    return table.concat {
      '%<',
      '%h',
      '%#StatusLineCWD#',
      cwd,
      path_sep,
      '%*',
      relative_fname,
      '%*',
      ' ',
      '%m',
      '%=',
      filetype,
      ' ',
      '(%l,%c%V)',
      ' ',
      '%P',
    }
  else
    return full_fname
  end
end

vim.opt.statusline = '%!v:lua.StatusLine()'
