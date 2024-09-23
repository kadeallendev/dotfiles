local util = require 'lspconfig.util'
return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    init_options = {
      clangdFileStatus = true,
    },
    filetypes = { 'c', 'cpp' },
  }
end
