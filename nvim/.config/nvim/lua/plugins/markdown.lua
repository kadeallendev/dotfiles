return {
  -- Better editing of markdown tables
  'Kicamon/markdown-table-mode.nvim',
  ft = 'markdown',
  config = function()
    require('markdown-table-mode').setup()
  end,
}
