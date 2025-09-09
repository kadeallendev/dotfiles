-- Displays color column only when line is greater than threshold
return {
  'm4xshen/smartcolumn.nvim',
  event = 'InsertEnter',
  opts = {
    scope = 'line',
    custom_colorcolumn = {
      ps1 = { '115' },
    },
  },
}
