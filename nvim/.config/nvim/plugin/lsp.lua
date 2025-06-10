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

-- Default keymaps
-- C-] go to definition
-- gq format
-- K hover documentation [vim.lsp.buf.hover] (I override to set winopts)
-- grn rename symbol [vim.lsp.buf.rename]
-- gra code action [vim.lsp.buf.code_action]
-- grr references [vim.lsp.buf.references]
-- gri implementation [vim.lsp.buf.implementation]
-- gO document symbols [vim.lsp.buf.document_symbol] (I override to use fzf-lua)
-- C-s signature help in insert mode [vim.lsp.buf.signature_help]

-- My keymaps

-- gr/ Creates doc comment, defined in lua/plugins/neogen.lua

-- Hover documentation
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover { max_width = 120, border = 'solid' }
end)

-- Document symbols search using fzf-lua
vim.keymap.set('n', 'gO', function()
  require('fzf-lua').lsp_document_symbols()
end, { desc = 'Search document symbols' })
