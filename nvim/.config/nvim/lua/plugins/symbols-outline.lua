-- Display symbols outline of file
return {
  'simrat39/symbols-outline.nvim',
  cmd = 'SymbolsOutline',
  opts = {},
  config = function()
    require('symbols-outline').setup()
  end,
}
