-- Display spelling mistakes as diagnostic warnings
return {
  'ravibrock/spellwarn.nvim',
  event = 'VeryLazy',
  config = function()
    local spellwarn = require('spellwarn')
    spellwarn.setup {
      severity = {
        spellbad = "HINT",
        spellcap = "HINT",
        spelllocal = "HINT",
        spellrare = "HINT"
      }
    }
    -- Set global variable
    vim.g.spellwarn_enabled = true
  end
}
