return {
  cmd = function(dispatchers)
    -- TODO: Sort this shit out
    -- local temp_path = vim.fn.stdpath 'cache'
    -- local data_path = vim.fn.stdpath 'data'
    -- local ps_path = vim.fs.joinpath(data_path, 'mason', 'packages', 'powershell-editor-services', 'PowershellEditorServices')
    -- local command_fmt =
    --   [[ & "%s/Start-EditorServices.psd1" -BundledModulesPath '%s' -LogPath '%s/powershell_es.log' -SessionDetailsPath '%s/powershell_es.session.json' -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal]]
    -- local command = command_fmt:format(ps_path, ps_path, temp_path, temp_path)
    -- local cmd = { 'pwsh', '-NoLogo', '-NoProfile', '-Command', command }
    local cmd = {
      'pwsh',
      '-NoLogo',
      '-NoProfile',
      '-Command',
      '& /home/kade/.local/share/nvim/mason/packages/powershell-editor-services/PowerShellEditorServices/Start-EditorServices.ps1 -BundledModulesPath /home/kade/.local/nvim/mason/packages/powershell-editor-services -LogPath /home/kade/.cache/nvim/powershell_es.log -SessionDetailsPath /home/kade/.cache/nvim/powershell_es.session.json -FeatureFlags @() -AdditionalModules @() -HostName nvim -HostProfileId 0 -HostVersion 1.0.0 -Stdio -LogLevel Normal',
    }
    return vim.lsp.rpc.start(cmd, dispatchers)
  end,
  filetypes = { 'ps1', 'psm1' },
  root_markers = { 'PSScriptAnalayzerSettings.psd1', '.git' },
  settings = {
    powershell = {
      codeFormatting = {
        Preset = 'OTBS',
      },
    },
  },
}
