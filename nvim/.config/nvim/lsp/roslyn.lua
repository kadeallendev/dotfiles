return {
  on_attach = function()
    vim.notify('Roslyn Attached', vim.log.levels.INFO)
  end,
  settings = {
    ['csharp|inlay_hints'] = {
      csharp_enable_inlay_hints_for_implicit_object_creation = true,
      csharp_enable_inlay_hints_for_implicit_variable_types = true,
      csharp_enable_inlay_hints_for_types = true,
    },
    ['csharp|code_lens'] = {
      dotnet_enable_references_code_lens = true,
    },
    ['csharp|completion'] = {
      dotnet_provide_regex_completions = true,
      dotnet_show_name_completion_suggestions = true,
    },
  },
}
