local function abbrev(mode, from, to)
  vim.cmd(string.format('%s %s %s', mode, from, to))
  vim.cmd(string.format('%s %s %s', mode, from:sub(1, 1):upper() .. from:sub(2), to:sub(1, 1):upper() .. to:sub(2)))
end

abbrev('iab', 'repsonse', 'response')
abbrev('iab', 'response', 'response')
abbrev('iab', 'reponse', 'response')
abbrev('iab', 'respones', 'response')
abbrev('iab', 'resposne', 'response')
abbrev('iab', 'respnose', 'response')
abbrev('iab', 'reposnse', 'response')
abbrev('iab', 'resoponse', 'response')
abbrev('iab', 'resopnse', 'response')
