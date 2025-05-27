-- Abbreviations

-- Helper to create abbreviations
local function ab(mode, lhs, rhs)
  vim.api.nvim_command(mode .. 'abbrev ' .. lhs .. ' ' .. rhs)
end

ab('i', 'PT', 'PartsTrader') -- PartsTrader
ab('i', '@@', 'kade.allen@ptml.com') -- Email
-- ab('i', 'gb', vim.g.gitbranch) -- Git branch
ab('i', 'ddate', os.date '%Y-%m-%d') -- Date
ab('i', 'ttime', os.date '%H:%M:%S') -- Time
ab('i', 'diso', vim.fn.system 'date -Iseconds') -- ISO 8601 time
ab('i', 'udiso', vim.fn.system 'date -Iseconds --utc') -- UTC ISO 8601 time
ab('i', 'td', 'TODO:') -- TODO
