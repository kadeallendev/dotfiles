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

--- Gets the active LSP clients on the current buffer.
---@return table|nil A table with the clients' id and name.
local function get_active_clients(bufnr)
  local clients = vim.lsp.get_clients()
  if bufnr then
    clients = vim.lsp.get_clients { bufnr = bufnr }
  end
  if #clients == 0 then
    ---@diagnostic disable-next-line: missing-return-value
    return
  end
  local client_items = {}
  for _, client in ipairs(clients) do
    table.insert(client_items, { id = client.id, name = client.name })
  end
  return client_items
end

--- Calls vim.ui.select with the clients, the given prompt, and calls the given function with the selection
---@param clients Array active LSP clients
---@param prompt string The prompt
---@param callback function A callback function with the client id
local function lsp_client_select(clients, prompt, callback)
  vim.ui.select(clients, {
    prompt = prompt,
    format_item = function(item)
      return string.format('%s (id: %d)', item.name, item.id)
    end,
  }, function(choice)
    if choice then
      callback(choice)
    end
  end)
end

--- Detach LSP client
--- Allows the user to select an LSP client to detach from the current buffer
vim.keymap.set('n', '<leader>ld', function()
  -- Get clients
  local clients = get_active_clients(0)
  if not clients or #clients == 0 then
    vim.notify('No active LSP clients attached to this buffer', vim.log.levels.INFO)
    return
  end
  -- Select client to detach
  lsp_client_select(clients, 'Select LSP client to detach', function(client)
    vim.lsp.buf_detach_client(0, client.id)
    vim.notify("Detached LSP client '" .. client.name .. "'")
  end)
end, { desc = 'Detach lsp client' })

--- Attach client
--- Allows the user to select an LSP client to attach to the current buffer
vim.keymap.set('n', '<leader>la', function()
  local clients = get_active_clients()
  if not clients or #clients == 0 then
    vim.notify('No active LSP clients', vim.log.levels.INFO)
    return
  end
  -- Select client to attach
  lsp_client_select(clients, 'Select LSP client to attach:', function(client)
    vim.lsp.buf_attach_client(0, client.id)
    vim.notify("Attached LSP client '" .. client.name .. "'")
  end)
end, { desc = 'Attach LSP client' })

--- Stop client
--- Allows the user to select an LSP client to stop
vim.keymap.set('n', '<leader>lS', function()
  local clients = get_active_clients()
  if not clients or #clients == 0 then
    vim.notify('No active LSP clients', vim.log.levels.INFO)
    return
  end
  -- Select client to stop
  lsp_client_select(clients, 'Select LSP client to stop:', function(client)
    vim.lsp.stop_client(client)
    vim.notify("Stopped LSP client '" .. client.name .. "'")
  end)
end)
