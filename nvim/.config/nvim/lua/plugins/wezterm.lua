-- Integrations with WezTerm

-- Only enable on mac
if require('kade.utils').is_mac() then
  return {
    'willothy/wezterm.nvim',
    config = true,
  }
else
  return {}
end
