return {
  bundle_path = vim.fn.stdpath("data") .. '/mason/packages/powershell-editor-services',
  settings = {
    powershell = {
      codeFormatting = {
        Preset = 'OTBS',
      },
    },
  },
}

-- NOTE: Changed LogLevel param in ~/.local/share/nvim/lazy/nvim-lspconfig/lsp/powershell_es.lua to Warning
