local conform = require 'conform'
local prettier = { 'prettierd', 'prettier', stop_after_first = true }

conform.setup {
  opts = {
    notify_on_error = true,
  },
  default_format_opts = {
    lsp_format = 'fallback',
  },
  formatters_by_ft = {
    c = { 'clang-format' }, -- NOTE: might be clang_format
    cpp = { 'clang-format' },
    lua = { 'stylua' },
    nix = { 'nixpkgs-fmt' },
    python = { 'ruff' },
    sh = { 'shfmt' },
    go = { 'goimports', 'gofmt' },
    css = prettier,
    java = { 'google-java-format' },
    html = prettier,
    javascript = prettier,
    typescript = prettier,
    yaml = prettier,
    json = prettier,
  },
  formatters = {
    prettier = {
      command = 'prettier',
      prepend_args = { '-w' },
    },
    prettierd = {
      command = 'prettierd',
      prepend_args = { '-w' },
    },
    shfmt = {
      command = 'shfmt',
      prepend_args = { '-i', '0', '-sr', '-kp' },
    },
  },
}

-- Format on save
vim.api.nvim_create_autocmd('BufWritePre', {
  callback = function(args)
    conform.format {
      bufnr = args.buf,
      lsp_fallback = true,
      quiet = true,
    }
  end,
})

-- Format file
vim.keymap.set('n', '<leader>lf', function()
  require('conform').format { async = true }
end, { desc = 'Format file' })
