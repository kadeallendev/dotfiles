local M = {
  preview_enabled = false,
  initialized = false,
}

-- Define heading heading_colors
local heading_colors = {
  h1 = 'NvimLightBlue',
  h2 = 'NvimLightRed',
  h3 = 'NvimLightGreen',
  h4 = 'NvimLightMagenta',
  h5 = 'NvimLightYellow',
}

-- Generate highlight commands with foreground/background parameters
local function create_heading_highlight_command(fg, bg)
  local cmd = {}
  for i = 1, 5 do
    table.insert(cmd, string.format('hi @markup.heading.%d.markdown guifg=%s guibg=%s', i, fg[i], bg[i]))
  end
  return table.concat(cmd, '\n')
end

-- Set normal highlighting (colored headings on default bg)
function M.set_normal_highlights()
  -- Headings
  local heading_fg_values = { heading_colors.h1, heading_colors.h2, heading_colors.h3, heading_colors.h4, heading_colors.h5 }
  local heading_bg_values = { 'background', 'background', 'background', 'background', 'background' }
  vim.cmd(create_heading_highlight_command(heading_fg_values, heading_bg_values))
end

-- Set preview highlighting (inverted colors)
function M.set_preview_highlights()
  -- Headings
  local heading_fg_values = { 'background', 'background', 'background', 'background', 'background' }
  local heading_bg_values = { heading_colors.h1, heading_colors.h2, heading_colors.h3, heading_colors.h4, heading_colors.h5 }
  vim.cmd(create_heading_highlight_command(heading_fg_values, heading_bg_values))
end

-- Enable markdown preview mode
function M.enable_preview()
  M.preview_enabled = true
  M.set_preview_highlights()
end

-- Disable markdown preview mode
function M.disable_preview()
  M.preview_enabled = false
  M.set_normal_highlights()
end

-- Toggle markdown preview mode
function M.toggle_preview()
  if M.preview_enabled then
    M.disable_preview()
  else
    M.enable_preview()
  end
end

-- Setup function to be called once
function M.setup()
  if not M.initialized then
    M.initialized = true
    M.set_normal_highlights()
  end
end

return M
