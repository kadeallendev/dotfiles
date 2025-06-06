local utils = require 'kade.utils'

local pid = vim.fn.getpid()

local mason_bin = utils.nvim_data_path() .. '/mason/bin'
local omnisharp_bin = mason_bin .. '/omnisharp-mono'

return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    cmd = {
      omnisharp_bin,
      '--languageserver',
      '--hostPID',
      tostring(pid),
    },
  }
end
