-- Diagnostic configuration
vim.diagnostic.config {
  -- Handlers
  signs = {
    severity = { min = vim.diagnostic.severity.WARN }
  },
  underline = true,
  virtual_text = true,
  virtual_lines = false,
  -- Options
  severity_sort = true,
  update_in_insert = false,
  float = {
    border = 'solid',
    style = 'minimal',
    focus = true,
    focusable = true,
  },
  jump = {
    float = true,
    severity = { min = vim.diagnostic.severity.WARN }
  }
}
