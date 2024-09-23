local X = {}
local vim = vim

-- Generate keymapper
local function generate_buf_keymapper(bufnr)
  return function(type, input, output, description, extraOptions)
    local options = { buffer = bufnr, desc = description }
    if extraOptions ~= nil then
      options = vim.tbl_deep_extend('force', options, extraOptions)
    end
    vim.keymap.set(type, input, output, options)
  end
end

-- Set the defaults for an LSP buffer
function X.set_defaults(client, bufnr)
  local buf_set_keymap = generate_buf_keymapper(bufnr)

  local function buf_set_option(o, v)
    vim.api.nvim_set_option_value(o, v, { buf = bufnr })
  end

  local cap = client.server_capabilities
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Goto definition
  if cap.definitionProvider then
    buf_set_keymap('n', 'gd', vim.lsp.buf.definition, 'Go to definition')
  end

  -- Go to declaration
  if cap.declarationProvider then
    buf_set_keymap('n', 'gD', vim.lsp.buf.declaration, 'Go to declaration')
  end

  -- Go to implementation
  if cap.implementationProvider then
    buf_set_keymap('n', 'gi', vim.lsp.buf.implementation, 'Go to implementation')
    buf_set_keymap('n', 'gI', function()
      require('fzf-lua').lsp_implementations()
    end, 'Search implementations')
  end

  -- Go to references
  if cap.referencesProvider then
    buf_set_keymap('n', 'gr', function()
      require('fzf-lua').lsp_references()
    end, 'Search references')
  end

  -- Hover docs
  if cap.hoverProvider then
    buf_set_keymap('n', 'K', vim.lsp.buf.hover, 'Hover docs')
  end

  -- Search code actions
  if cap.codeActionProvider then
    buf_set_keymap({ 'n', 'v' }, '<leader>la', function()
      -- TODO: I think this does the whole file, i don't know if that's what i want
      local line_count = vim.api.nvim_buf_line_count(bufnr)
      local range = {
        start = { line = 1, character = 1 },
        ['end'] = { line = line_count, character = 1 },
      }
      vim.lsp.buf.code_action { range = range.range }
    end)
  end

  -- Rename symbol
  if cap.renameProvider then
    buf_set_keymap('n', '<leader>lr', vim.lsp.buf.rename, 'Rename symbol')
  end

  -- Search document symbols
  if cap.documentSymbolProvider then
    buf_set_keymap('n', '<leader>/s', function()
      require('fzf-lua').lsp_document_symbols()
    end, 'Search document symbols')
  end

  -- Search LSP finder
  if cap.documentSymbolProvider then
    buf_set_keymap('n', '<leader>/l', function()
      require('fzf-lua').lsp_finder()
    end, 'Lsp Finder')
  end

  -- Search workplace symbols
  if cap.workplaceSymbolProvider then
    buf_set_keymap('n', '<leader>/S', function()
      require('fzf-lua').lsp_workspace_symbols()
    end, 'Search workplace symbols')
  end

  -- Show signature
  buf_set_keymap('n', '<leader>ls', vim.lsp.buf.signature_help, 'Show signature')

  -- Show line diagnostics
  buf_set_keymap('n', '<leader>le', vim.diagnostic.open_float, 'Show line diagnostics')

  -- Highlight references under cursor
  if cap.documentHighlightProvider then
    vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.document_highlight,
    })

    vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
      buffer = bufnr,
      callback = vim.lsp.buf.clear_references,
    })
  end

  -- Ignore warnings
  local ft = vim.bo[bufnr].filetype
  if ft == 'sh' or ft == 'lua' then
    buf_set_keymap('n', '<leader>li', function()
      local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
      local msgs = vim.diagnostic.get(bufnr)
      local last, result = unpack { 'error', '' }
      if ft == 'lua' then
        result = '---@diagnostic disable-next-line'
      else
        for _, d in pairs(msgs) do
          if d.lnum == (row - 1) and d.code ~= last then
            result = (result ~= '') and result .. ',' .. d.code or '#shellcheck disable=' .. d.code
            last = tostring(d.code)
          end
        end
      end
      if result ~= '' then
        vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, { result })
      end
    end, 'Ignore warnings')
  end
end

return X
