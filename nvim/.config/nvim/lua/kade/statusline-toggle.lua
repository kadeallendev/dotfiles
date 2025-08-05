-- Toggles the statusline highlights between the default and my custom highlights
local M = {
  using_custom = false
}

function M.set_default()
  M.using_custom = false
  vim.api.nvim_set_hl(0, 'StatusLineNC', { fg = 'NvimLightGrey2', bg = 'NvimDarkGrey4' })
  vim.api.nvim_set_hl(0, 'StatusLine', { fg = 'NvimDarkGrey3', bg = 'NvimLightGrey3' })
end

function M.set_custom()
  M.using_custom = true
  vim.api.nvim_set_hl(0, 'StatusLineNC', { bg = 'NvimDarkGrey2', fg = 'NvimDarkGrey4' })
  vim.api.nvim_set_hl(0, 'StatusLine', { bg = 'NvimDarkGrey2', fg = 'NvimLightBlue' })
end

function M.toggle()
  if M.using_custom then
    M.set_default()
  else
    M.set_custom()
  end
end

return M
