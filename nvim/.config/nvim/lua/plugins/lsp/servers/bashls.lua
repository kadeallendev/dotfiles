local util = require 'lspconfig.util'
return function(on_attach)
  return {
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
    end,
    cmd = { 'bash-language-server', 'start' },
    filetypes = { 'sh', 'zsh' },
    root_dir = util.find_git_ancestor,
    single_file_support = true,
  }
end
