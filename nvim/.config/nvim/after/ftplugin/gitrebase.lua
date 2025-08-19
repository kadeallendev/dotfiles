local function set_keymap(letter, word)
  local lhs = '<leader>' .. letter
  local rhs = ':s/\\v^\\w+/' .. word .. '<CR>:nohl<CR>'
  vim.keymap.set('n', lhs, rhs, { buffer = true })
end

set_keymap('r', 'reword')
set_keymap('f', 'fixup')
set_keymap('p', 'pick')
set_keymap('s', 'squash')
set_keymap('e', 'edit')
set_keymap('d', 'drop')
