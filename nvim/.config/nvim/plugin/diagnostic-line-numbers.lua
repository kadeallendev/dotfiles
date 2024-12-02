-- Colours line numbers based off their diagnostic level
local cb = require('cyberdream.colors').default

-- Define highlight colours
vim.cmd(string.format('highlight DiagnosticLineNrError guifg=%s gui=bold', cb.red))
vim.cmd(string.format('highlight DiagnosticLineNrWarn guifg=%s gui=bold', cb.yellow))
vim.cmd(string.format('highlight DiagnosticLineNrInfo guifg=%s gui=bold', cb.blue))
vim.cmd(string.format('highlight DiagnosticLineNrHint guifg=%s gui=bold', cb.cyan))

-- Define signs
vim.fn.sign_define('DiagnosticSignError', { text = '', numhl = 'DiagnosticLineNrError' })
vim.fn.sign_define('DiagnosticSignWarn', { text = '', numhl = 'DiagnosticLineNrWarn' })
vim.fn.sign_define('DiagnosticSignInfo', { text = '', numhl = 'DiagnosticLineNrInfo' })
vim.fn.sign_define('DiagnosticSignHint', { text = '', numhl = 'DiagnosticLineNrHint' })

-- Update numbers on diagnostic publish
vim.api.nvim_create_autocmd({ 'DiagnosticChanged' }, {
  callback = function(args)
    local bufnr = args.buf
    -- Remove current signs
    vim.fn.sign_unplace('diagnostics', { buffer = bufnr })

    local diagnostics = vim.diagnostic.get(bufnr)
    for _, diagnostic in ipairs(diagnostics) do
      local diagnostic_severity = vim.diagnostic.severity[diagnostic.severity]
      local sign_name = 'DiagnosticSign' .. diagnostic_severity:sub(1, 1):upper() .. diagnostic_severity:sub(2):lower()
      vim.fn.sign_place(0, 'diagnostics', sign_name, bufnr, { lnum = diagnostic.lnum + 1, priority = 10 })
    end
  end,
})