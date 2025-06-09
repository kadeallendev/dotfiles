vim.diagnostic.config {
  signs = true,
  underline = true,
  update_in_insert = true,
  virtual_text = true,
  virtual_lines = false,
  severity_sort = true,
  float = {
    border = 'solid',
    style = 'minimal',
    focus = true,
    focusable = true,
  },
}

vim.lsp.enable {
  'html',
  'luals',
  'powershell_es',
  'bashls',
  'yamlls',
  'clangd',
  'roslyn',
  'gopls',
  'jsonls',
  'rust_analyzer',
  -- 'marksman', -- TODO: Sort out why this throws an error when opening lua file
}

vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover {
    max_width = 120,
    border = 'solid',
  }
end)
