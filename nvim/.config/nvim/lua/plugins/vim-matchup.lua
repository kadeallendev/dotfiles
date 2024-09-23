-- Enables better use of '%' such as with if statements
return {
  {
    'andymass/vim-matchup',
    event = 'InsertEnter',
    setup = function()
      vim.g.matchup_matchparen_offscreen = { method = 'popup' }
    end,
  },
}
