return {
  -- Lsp Signature
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    opts = {
      bind = true,
      handler_opts = {
        border = 'rounded',
      },
      hint_enable = false,
      max_width = 100,
    },
    config = function(_, opts)
      require('lsp_signature').setup(opts)

      -- Lsp Signature config
      vim.keymap.set({ 'i' }, '<C-k>', function()
        require('lsp_signature').toggle_float_win()
      end, { desc = 'Toggle signature help' })
    end,
  },
  -- Lsp Config
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      'folke/neodev.nvim',
      'ravibrock/spellwarn.nvim',
      'ray-x/lsp_signature.nvim',
    },
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      require('neodev').setup()
      require('spellwarn').setup()

      local lspconfig = require 'lspconfig'
      lspconfig.server_aliases()
      local keymaps = require 'plugins.lsp.keymaps'

      -- Lsp config
      local config = {
        virtual_text = true,
        virtual_lines = false,
        severity_sort = true,
        underline = true,
        update_in_insert = true,
        float = {
          border = 'single',
          style = 'minimal',
          focus = false,
          focusable = false,
        },
      }
      lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, config)
      vim.diagnostic.config(config)

      local border = {
        border = 'single',
      }
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, border)
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, border)

      -- Capabilities
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      if pcall(require, 'cmp_nvim_lsp') then
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      end

      -- On attach settings
      local function on_attach(client, bufnr)
        keymaps.set_defaults(client, bufnr)
        -- if pcall(require, 'lsp_signature') then
        --   require('lsp_signature').on_attach(lsp_signature_config)
        -- end
      end

      -- Servers to install with configs
      local servers = {
        bashls = require 'plugins.lsp.servers.bashls'(on_attach),
        gopls = require 'plugins.lsp.servers.gopls'(on_attach),
        clangd = require 'plugins.lsp.servers.clangd'(on_attach),
        lua_ls = {
          inlay_hints = { enabled = true },
        },
        rust_analyzer = {},
        templ = {},
        pyright = {},
        prettier = {},
        prettierd = {},
        cmake = {},
        marksman = {},
      }

      -- Others to install
      local ensure_installed = {
        'stylua',
        'clang-format',
        'yamlfmt',
      }

      -- Default lsp server config
      local default_lsp_config = {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
          debounce_text_changes = 200,
          allow_incremental_sync = true,
        },
      }

      -- Get tables of server names and configs
      local server_names = {}
      local server_configs = {}
      for server_name, server_config in ipairs(servers) do
        table.insert(server_names, server_name)
        server_configs[server_name] = server_config
      end

      -- Install using mason
      vim.list_extend(ensure_installed, server_names)
      require('mason-tool-installer').setup { ensure_installed = ensure_installed }

      local present_mason, mason = pcall(require, 'mason-lspconfig')
      if present_mason then
        mason.setup { ensure_installed = server_names }
        mason.setup_handlers {
          function(server)
            -- Set config for server
            local merged_config = vim.tbl_deep_extend('force', default_lsp_config, server_configs[server] or {})
            lspconfig[server].setup(merged_config)

            -- Setup rust tools
            if server == 'rust_analyzer' then
              local present_rust_tools, rust_tools = pcall(require, 'rust-tools')
              if present_rust_tools then
                rust_tools.setup { server = merged_config }
              end
            end
          end,
        }
      end
    end,
  },
}
