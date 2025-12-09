local conform = require 'conform'
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

conform.setup {
  notify_on_error = true,
  notify_no_formatters = true,
  default_format_opts = {},
  format_on_save = {
    timeout_ms = 500,
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    -- c = { 'clang-format' }, -- NOTE: might be clang_format
    -- cpp = { 'clang-format' },
    -- lua = { 'stylua' },
    -- rust = { 'rustfmt', lsp_format = 'fallback' },
    -- nix = { 'nixpkgs-fmt' },
    -- python = { 'ruff' },
    -- sh = { 'shfmt' },
    -- go = { 'goimports', 'gofmt' },
    -- java = { 'google-java-format' },
    csharp = { 'csharpier' },
    css = prettier,
    yaml = { 'yamlfmt' },
    typescript = { 'biome', lsp_format = "never" }
  },
  formatters = {
    prettierd = {
      command = 'prettierd',
      prepend_args = { '-w', '--single-quote' },
    },
    shfmt = {
      command = 'shfmt',
      prepend_args = { '-i', '0', '-sr', '-kp' },
    },
  },
}

--[[ -- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    conform.format {
      bufnr = args.buf,
      lsp_fallback = true,
      quiet = true,
    }
  end,
}) ]]

-- Format file
vim.keymap.set('n', '<leader>gq', function()
  require('conform').format { async = true }
end, { desc = 'Format file' })
