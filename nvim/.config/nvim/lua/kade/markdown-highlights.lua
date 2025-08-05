local M = {
  preview_enabled = false,
  initialized = false,
}

-- Define heading heading_colors
local heading_colors = {
  h1 = 'NvimLightMagenta',
  h2 = 'NvimLightBlue',
  h3 = 'NvimLightRed',
  h4 = 'NvimLightGreen',
  h5 = 'NvimLightYellow',
}

--- Sets the highlights for markdown headings
--- Sets the @markup.heading.<level>.markdown group.
---@param fg array Array of foreground colors
---@param bg array Array of background colors
local function set_heading_highlights(fg, bg)
  local len = vim.tbl_count(fg)
  for i = 1, len do
    local group = string.format('@markup.heading.%d.markdown', i)
    vim.api.nvim_set_hl(0, group, { fg = fg[i], bg = bg[i], bold = true })
  end
end

--- Set normal highlighting (colored headings on default bg)
--- Sets the default highlights for markdown headings
function M.set_normal_highlights()
  -- Headings
  local heading_fg_values = { heading_colors.h1, heading_colors.h2, heading_colors.h3, heading_colors.h4, heading_colors.h5 }
  local heading_bg_values = { 'background', 'background', 'background', 'background', 'background' }
  set_heading_highlights(heading_fg_values, heading_bg_values)
  -- Checklists
  vim.api.nvim_set_hl(0, '@markup.list.checked.markdown', { bg = 'NvimDarkGrey2', fg = 'NvimLightCyan' })
end

--- Set preview highlighting (inverted colors)
--- Sets the highlights for previewing markdown
function M.set_preview_highlights()
  -- Headings
  local heading_fg_values = { 'background', 'background', 'background', 'background', 'background' }
  local heading_bg_values = { heading_colors.h1, heading_colors.h2, heading_colors.h3, heading_colors.h4, heading_colors.h5 }
  set_heading_highlights(heading_fg_values, heading_bg_values)
  -- Checklists
  vim.api.nvim_set_hl(0, '@markup.list.checked.markdown', { bg = 'NvimLightCyan', fg = 'NvimDarkGrey2' })
end

--- Enable markdown preview mode
--- Updates highlights, sets 'conceallevel' to 2, and disables diagnostics
function M.enable_preview()
  M.preview_enabled = true
  M.set_preview_highlights()
  vim.opt.conceallevel = 2
  vim.diagnostic.enable(false)
end

--- Disable markdown preview mode
--- Updates highlights, sets 'conceallevel' to 0, and enables diagnostics
function M.disable_preview()
  M.preview_enabled = false
  M.set_normal_highlights()
  vim.opt.conceallevel = 0
  vim.diagnostic.enable(true)
end

--- Toggle markdown preview mode
function M.toggle_preview()
  if M.preview_enabled then
    M.disable_preview()
  else
    M.enable_preview()
  end
end

--- Setup function to be called once
function M.setup()
  if not M.initialized then
    M.initialized = true
    M.set_normal_highlights()
  end
end

return M
