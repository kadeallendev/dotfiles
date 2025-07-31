-- Tool to make installing LSPs better
return {
  'williamboman/mason.nvim',
  lazy = false,
  build = ':MasonUpdate',
  config = function()
    require('mason').setup {
      ui = {
        border = 'rounded',
        width = 0.8,
        height = 0.8,
      },
      registries = {
        'github:mason-org/mason-registry',
        'github:Crashdummyy/mason-registry',
      },
    }

    local mason_packages = {
      'lua-language-server',
      'stylua',
      -- .NET
      'csharpier',
      'roslyn',
      -- Docker
      'docker-compose-language-service',
      'dockerfile-language-server',
      -- Web
      'html-lsp',
      'typescript-language-server',
      -- Go
      'goimports-reviser',
      'golines',
      'gopls',
      -- Markdown
      'marksman',
      -- Bash
      'shfmt',
      'bash-language-server',
      -- Config
      'jq',
      'json-lsp',
      'yaml-language-server',
      'gh-actions-language-server',
      -- C
      -- 'clang-format',
      -- Rust
      'rust-analyzer',
      -- SQL
      'sql-formatter',
      -- Powershell
      'powershell-editor-services',
    }

    local mr = require 'mason-registry'
    local function ensure_installed()
      for _, tool in ipairs(mason_packages) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end
    if mr.refresh then
      mr.refresh(ensure_installed)
    else
      ensure_installed()
    end
  end,
}
