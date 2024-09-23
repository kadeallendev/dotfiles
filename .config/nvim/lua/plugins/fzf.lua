-- Fuzzy searching with fzf
return {
  'ibhagwan/fzf-lua',
  event = 'VeryLazy',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require 'config.fzf'
  end,
}
