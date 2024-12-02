vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.highlight.priorities.semantic_tokens = 90

-- require('lspconfig').powershell_es.setup {
--   -- bundle_path = '~/.local/share/nvim/lsp/PowerShellEditorServices',
--   cmd = {
--     'pwsh',
--     '-NoLogo',
--     '-NoProfile',
--     '-Command',
--     '/home/kade/.local/share/nvim/lsp/PowerShellEditorServices/PowerShellEditorServices/Start-EditorServices.ps1',
--   },
--   on_attach = function(client, bufnr)
--     local defaults = require('plugins.lsp.keymaps').set_defaults
--     defaults(client, bufnr)
--   end,
--   settings = {
--     powershell = {
--       codeFormatting = {
--         Preset = 'OTBS',
--       },
--     },
--   },
-- }
