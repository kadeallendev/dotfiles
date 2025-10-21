--- LSP Setup

-- Enable LSPs
vim.lsp.enable {
  -- Web
  'html',  -- npm i -g vscode-langservers-extracted
  'cssls', -- npm i -g vscode-langservers-extracted
  'ts_ls', -- brew install typescript-language-server
  'biome', -- brew install biome
  'phpactor',
  -- Markup
  'yamlls',    -- brew install yaml-language-server
  'jsonls',    -- npm i -g vscode-langservers-extracted
  'marksman',  -- brew install marksman
  'harper_ls', -- brew install harper
  -- Dotnet
  'powershell_es',
  -- Other
  'lua_ls',                          -- brew install lua-language-server
  'bashls',                          -- brew install bash-language-server
  'clangd',
  'gopls',                           -- brew install gopls
  'rust_analyzer',                   -- brew install rust-analyzer
  -- Docker
  'docker_language_server',          -- go install github.com/docker/docker-language-server/cmd/docker-language-server@latest
  'docker_compose_language_service', -- brew install docker-composer-langserver
}

-- Default keymaps
-- C-] go to definition (I also add gd)
-- gq format
-- K hover documentation [vim.lsp.buf.hover] (I override to set winopts)
-- grn rename symbol [vim.lsp.buf.rename]
-- gra code action [vim.lsp.buf.code_action]
-- grr references [vim.lsp.buf.references] (I override to use fzf-lua)
-- gri implementation [vim.lsp.buf.implementation]
-- gO document symbols [vim.lsp.buf.document_symbol] (I override to use fzf-lua)
-- C-s signature help in insert mode [vim.lsp.buf.signature_help]

-- My keymaps

-- gr/ Creates doc comment, defined in lua/plugins/neogen.lua
-- <leader>/s Search workspace symbols

local fzf = require('fzf-lua')

-- Goto definition
-- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
vim.keymap.set('n', 'gd', '<C-]>', { desc = "Go to definition" })

-- References
vim.keymap.set('n', 'grr', fzf.lsp_references, { desc = "Search LSP references" })

-- Hover documentation
vim.keymap.set('n', 'K', function()
  vim.lsp.buf.hover { max_width = 120, border = 'solid' }
end)

-- Document symbols search using fzf-lua
vim.keymap.set('n', 'gO', fzf.lsp_document_symbols, { desc = 'Search document symbols' })

-- Workspace symbols using fzf-lua
vim.keymap.set('n', '<leader>/s', fzf.lsp_workspace_symbols, { desc = "Search workspace symbols" })

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
