local conform = require 'conform'

conform.setup {
  notify_on_error = true,
  notify_no_formatters = true,
  default_format_opts = {
    lsp_format = 'fallback',
  },
  format_on_save = { timeout_ms = 500, lsp_format = 'fallback' },
  formatters_by_ft = {
    -- c = { 'clang-format' }, -- NOTE: might be clang_format
    -- cpp = { 'clang-format' },
    lua = { 'stylua' },
    -- rust = { 'rustfmt', lsp_format = 'fallback' },
    -- nix = { 'nixpkgs-fmt' },
    -- python = { 'ruff' },
    -- sh = { 'shfmt' },
    -- go = { 'goimports', 'gofmt' },
    -- java = { 'google-java-format' },
    csharp = { 'csharpier' },
    -- yaml = { 'yamlfmt' },
    typescript = { 'biome', lsp_format = 'never' },
    html = { 'biome', lsp_format = 'never' },
    css = { 'biome', lsp_format = 'never' },
  },
  formatters = {
    shfmt = {
      command = 'shfmt',
      prepend_args = { '-i', '0', '-sr', '-kp' },
    },
    -- Biome's HTML and CSS formatters are experimental and disabled by
    -- default; explicitly enable them so `biome format` actually touches
    -- .html/.css files (without this, biome silently no-ops on them).
    biome = {
      append_args = {
        '--html-formatter-enabled=true',
        '--css-formatter-enabled=true',
      },
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
