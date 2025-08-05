-- Toggles the statusline highlights between the default and my custom highlights
local M = {
  current = 'default',
}

function M.set_default()
  M.current = 'default'
  vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = 'NvimLightGrey2', bg = 'NvimDarkGrey4' })
  vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'NvimDarkGrey3', bg = 'NvimLightGrey3' })
end

function M.set_custom()
  M.current = 'custom'
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NvimDarkGrey2', fg = 'NvimDarkGrey4' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NvimDarkGrey2', fg = 'NvimLightBlue' })
end

function M.toggle()
  if M.current == 'default' then
    M.set_custom()
  else
    M.set_default()
  end
end

return M
