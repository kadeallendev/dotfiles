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

-- LSP Checkhealth
vim.keymap.set('n', '<leader>lc', '<CMD>checkhealth lsp<CR>', { desc = 'Checkhealth lsp' })
-- Deprecated keymap
vim.keymap.set('n', '<leader>cl', function()
  vim.notify('Deprecated: Use <Space>lc', vim.log.levels.WARN)
end, { desc = 'Checkhealth lsp' })

-- Detach client
vim.keymap.set('n', '<leader>ld', function()
  -- Get clients
  local clients = vim.lsp.get_clients { bufnr = 0 }
  -- Return if no clients
  if #clients == 0 then
    vim.notify('No LSP clients attached to this buffer', vim.log.levels.INFO)
    return
  end
  -- Create table of client ids and names
  local client_items = {}
  for _, client in ipairs(clients) do
    table.insert(client_items, { id = client.id, name = client.name })
  end
  -- Select client
  vim.ui.select(client_items, {
    prompt = 'Select LSP client to detach:',
    format_item = function(item)
      return string.format('%s (id: %d)', item.name, item.id)
    end,
  }, function(choice)
    if choice then
      vim.lsp.buf_detach_client(0, choice.id)
    end
  end)
end, { desc = 'Detach lsp client' })

-- Attach client
vim.keymap.set('n', '<leader>la', function()
  -- Get all active clients
  local clients = vim.lsp.get_clients()
  -- Return if no active clients
  if #clients == 0 then
    vim.notify('No LSP clients active', vim.log.levels.INFO)
    return
  end
  -- Create table of clients
  local client_items = {}
  for _, client in ipairs(clients) do
    table.insert(client_items, { id = client.id, name = client.name })
  end
  -- Select client
  vim.ui.select(client_items, {
    prompt = 'Select LSP client to attach:',
    format_item = function(item)
      return string.format('%s (id: %d)', item.name, item.id)
    end,
  }, function(choice)
    if choice then
      vim.lsp.buf_attach_client(0, choice.id)
    end
  end)
end)
