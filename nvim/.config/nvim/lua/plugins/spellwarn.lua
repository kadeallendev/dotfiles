-- Display spelling mistakes as diagnostic warnings
return {
  'ravibrock/spellwarn.nvim',
  event = 'VeryLazy',
  config = function()
    vim.g.spellwarn_enabled = false -- Disable by default, toggle on with

    local spellwarn = require('spellwarn')
    spellwarn.setup {
      enable = vim.g.spellwarn_enabled,
      severity = {
        spellbad = "HINT",
        spellcap = "HINT",
        spelllocal = "HINT",
        spellrare = "HINT"
      }
    }

    local function toggle()
      if vim.g.spellwarn_enabled then
        spellwarn.disable()
        vim.g.spellwarn_enabled = false
      else
        spellwarn.enable()
        vim.g.spellwarn_enabled = true
      end
      print(vim.g.spellwarn_enabled)
    end
    vim.keymap.set('n', '<leader>tS', toggle, { desc = 'Toggle SpellWarn plugin' })
  end
}
