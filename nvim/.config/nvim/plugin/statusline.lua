-- Status line configuration
-- Displays filename, modified status, and line number
-- The format string looks like this
-- '%<%h %f %m%=(%l,%c%V) %P'

-- Set highlight for cwd
vim.api.nvim_set_hl(0, 'StatusLineCWD', { fg = '#5ea1ff', bold = true })

function StatusLine()
  local cwd = vim.fn.getcwd()
  local home = vim.fn.expand '~'
  local full_fname = vim.fn.expand '%:p'
  local filetype = vim.bo.filetype
  local bufname = vim.fn.bufname()

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

    return table.concat {
      '%<',
      '%h',
      '%#StatusLineCWD#',
      cwd,
      path_sep,
      '%*',
      relative_fname,
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
