return {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.git' },
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
      },
      workspace = {
        checkThirdParty = false,
        library = vim.api.nvim_get_runtime_file('', true),
      },
    },
  },
}
