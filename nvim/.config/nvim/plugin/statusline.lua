-- Status line configuration
-- Displays filename, modified status, and line number
-- The format string looks like this
-- '%<%h %f %m%=(%l,%c%V) %P'

-- TODO: Move this to a utils that works
local jira_prefix_pat = '^[A-Za-z]+%-%d+'
local function get_branch_prefix()
  local handle = io.popen 'git rev-parse --abbrev-ref HEAD 2> /dev/null'
  if handle == nil then
    print 'ERROR: unable to get branch name'
    return
  end
  local branch_name = handle:read('*a'):gsub('%s+', '') -- Remove trailing whitespace
  handle:close()
  return branch_name:match(jira_prefix_pat)
end

-- Set highlight for cwd
vim.api.nvim_set_hl(0, 'StatusLineCWD', { fg = '#5ea1ff', bold = true })
vim.api.nvim_set_hl(0, 'StatusLineBranch', { fg = '#bd5eff', bold = true })

function StatusLine()
  local cwd = vim.fn.getcwd()
  local home = vim.fn.expand '~'
  local full_fname = vim.fn.expand '%:p'
  local filetype = vim.bo.filetype
  local bufname = vim.fn.bufname()
  local branch_prefix = get_branch_prefix()

  if bufname:sub(1, 6) == 'oil://' then
    return bufname
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
    if branch_prefix then
      relative_fname = relative_fname .. '%#StatusLineBranch#' .. ' ' .. branch_prefix
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
