local util = require 'lspconfig.util'
return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    settings = {
      hints = {
        assignVariableTypes = true,
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
        rangeVariableTypes = true,
      },
    },
  }
end
