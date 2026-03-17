local M = {}

--- URL-decodes the current line in place.
--- Converts percent-encoded characters (e.g. `%20`) and `+` to their decoded forms.
M.decode_line = function()
  local line = vim.api.nvim_get_current_line()
  local decoded = line
    :gsub('%%(%x%x)', function(hex)
      return string.char(tonumber(hex, 16))
    end)
    :gsub('+', ' ')
  vim.api.nvim_set_current_line(decoded)
end

--- URL-encodes the current line in place.
--- Converts all characters except unreserved characters (`A-Z a-z 0-9 - _ . ~`) to percent-encoded form.
M.encode_line = function()
  local line = vim.api.nvim_get_current_line()
  local encoded = line:gsub('[^%w%-_%.~]', function(c)
    return string.format('%%%02X', string.byte(c))
  end)
  vim.api.nvim_set_current_line(encoded)
end

--- URL-decodes the visual selection in place.
--- Converts percent-encoded characters (e.g. `%20`) and `+` to their decoded forms.
M.decode_selection = function()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local end_row = end_pos[2] - 1
  local end_col = math.min(end_pos[3], #vim.api.nvim_buf_get_lines(0, end_row, end_row + 1, false)[1])
  local lines = vim.api.nvim_buf_get_text(0, start_pos[2] - 1, start_pos[3] - 1, end_row, end_col, {})
  for i, line in ipairs(lines) do
    lines[i] = line
      :gsub('%%(%x%x)', function(hex)
        return string.char(tonumber(hex, 16))
      end)
      :gsub('+', ' ')
  end
  vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_row, end_col, lines)
end

--- URL-encodes the visual selection in place.
--- Converts all characters except unreserved characters (`A-Z a-z 0-9 - _ . ~`) to percent-encoded form.
M.encode_selection = function()
  local start_pos = vim.fn.getpos "'<"
  local end_pos = vim.fn.getpos "'>"
  local end_row = end_pos[2] - 1
  local end_col = math.min(end_pos[3], #vim.api.nvim_buf_get_lines(0, end_row, end_row + 1, false)[1])
  local lines = vim.api.nvim_buf_get_text(0, start_pos[2] - 1, start_pos[3] - 1, end_row, end_col, {})
  for i, line in ipairs(lines) do
    lines[i] = line:gsub('[^%w%-_%.~]', function(c)
      return string.format('%%%02X', string.byte(c))
    end)
  end
  vim.api.nvim_buf_set_text(0, start_pos[2] - 1, start_pos[3] - 1, end_row, end_col, lines)
end

return M
