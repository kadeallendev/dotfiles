local function set_hl(col, color)
  vim.api.nvim_set_hl(0, 'csvCol' .. col, { fg = color })
end

set_hl(2, 'NvimLightMagenta')
set_hl(3, 'NvimLightYellow')
set_hl(4, 'NvimLightBlue')
set_hl(5, 'NvimLightRed')
set_hl(6, 'NvimLightCyan')
set_hl(7, 'NvimLightGreen')
set_hl(8, 'NvimLightGrey4')
