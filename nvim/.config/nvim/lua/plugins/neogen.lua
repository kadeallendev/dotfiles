-- Generate doc comments
return {
  'danymat/neogen',
  event = 'InsertEnter',
  config = function()
    local neogen = require 'neogen'
    neogen.setup {
      snippet_engine = 'luasnip',
      enabled = true,
      languages = {
        python = {
          template = {
            annotation_convention = 'google_docstrings',
          },
        },
        rust = {
          template = { annotation_convention = 'rustdoc' },
        },
        go = {
          template = {
            annotation_convention = 'godoc',
          },
        },
        cpp = {
          template = {
            annotation_convention = 'doxygen',
          },
        },
        c = {
          template = {
            annotation_convention = 'doxygen',
          },
        },
      },
    }
    vim.keymap.set('n', 'gr/', function()
      neogen.generate {}
    end, { desc = 'Generate doc comment' })
  end,
}
