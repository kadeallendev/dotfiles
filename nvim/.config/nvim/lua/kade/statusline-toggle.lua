-- Toggles the statusline highlights between the default and my custom highlights
local M = {
  current = 'default',
}

function M.set_default()
  M.current = 'default'
  vim.cmd [[
    hi StatusLine guifg=NvimDarkGrey3 guibg=NvimLightGrey3
    hi StatusLineNC guifg=NvimLightGrey2 guibg=NvimDarkGrey4
  ]]
end

function M.set_custom()
  M.current = 'custom'
  vim.cmd [[
    hi StatusLine guibg=NvimDarkGrey2 guifg=NvimLightBlue
    hi StatusLineNC guibg=NvimDarkGrey2 guifg=NvimDarkGrey4
  ]]
end

function M.toggle()
  if M.current == 'default' then
    M.set_custom()
  else
    M.set_default()
  end
end

return M
