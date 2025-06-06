-- Fuzzy searching with fzf
return {
  'ibhagwan/fzf-lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require 'plugins.config.cfg-fzf'
  end,
}
