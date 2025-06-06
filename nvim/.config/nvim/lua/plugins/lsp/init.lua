return {
  -- Lsp Signature
  {
    'ray-x/lsp_signature.nvim',
    event = 'InsertEnter',
    config = function()
      require('lsp_signature').setup {
        bind = true,
        handler_opts = {
          border = 'solid',
        },
        hint_enable = false,
        max_width = 100,
        max_height = 16,
        toggle_key = '<C-k>',
      }
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
          border = 'solid',
          style = 'minimal',
          focus = true,
          focusable = true,
        },
      }
      lspconfig.util.default_config = vim.tbl_deep_extend('force', lspconfig.util.default_config, config)
      vim.diagnostic.config(config)

      local border = {
        border = 'rounded',
        winhighlight = 'NormalFloat:Pmenu',
      }
      vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(vim.lsp.handlers.hover, border)
      vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(vim.lsp.handlers.hover, border)

      -- Capabilities
      local capabilities = vim.tbl_deep_extend('force', {}, vim.lsp.protocol.make_client_capabilities(), require('cmp_nvim_lsp').default_capabilities())

      -- On attach settings
      local function on_attach(client, bufnr)
        keymaps.set_defaults(client, bufnr)
        -- if pcall(require, 'lsp_signature') then
        --   require('lsp_signature').on_attach(lsp_signature_config)
        -- end
      end

      require('mason-tool-installer').setup {
        ensure_installed = {
          'yamlfmt',
          'stylua',
        },
      }

      -- local present_mason, mason = pcall(require, 'mason-lspconfig')
      require('mason').setup()
      require('mason-lspconfig').setup {
        ensure_installed = {
          'lua_ls',
          'powershell_es',
        },
        handlers = {
          -- Default handler
          function(server_name)
            require('lspconfig')[server_name].setup {
              capabilities = capabilities,
              on_attach = on_attach,
            }
          end,

          -- Powershell
          powershell_es = function()
            lspconfig.powershell_es.setup {
              capabilities = capabilities,
              on_attach = on_attach,
              settings = {
                powershell = {
                  codeFormatting = {
                    Preset = 'OTBS',
                  },
                },
              },
            }
          end,
        },
      }
    end,
  },
}

-- -- Default lsp server config
-- local default_lsp_config = {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	flags = {
-- 		debounce_text_changes = 200,
-- 		allow_incremental_sync = true,
-- 	},
-- }
--
-- -- Get tables of server names and configs
-- local server_names = {}
-- local server_configs = {}
-- for server_name, server_config in ipairs(servers) do
-- 	table.insert(server_names, server_name)
-- 	server_configs[server_name] = server_config
-- end
--
-- -- Install using mason
-- vim.list_extend(ensure_installed, server_names)

-- Servers to install with configs
-- local servers = {
--   gopls = require 'plugins.lsp.servers.gopls'(on_attach),
--   -- clangd = require 'plugins.lsp.servers.clangd'(on_attach),
--   omnisharp = {
--     -- cmd = { 'ls' },
--   },
--   -- omnisharp = {
--   --   cmd = { '/Users/kadeallen/.local/share/lsp/omnisharp/run' },
--   --   -- cmd = { 'dotnet', '/Users/kadeallen/.local/share/nvim/mason/packages/omnisharp/libexec/Omnisharp.dll' },
--   --   -- settings = {
--   --   --   FormattingOptions = {
--   --   --     EnableEditorConfigSupport = true,
--   --   --     OrganizeImports = true,
--   --   --   },
--   --   -- },
--   --   -- MsBuild = {
--   --   --   LoadProjectsOnDemand = nil,
--   --   -- },
--   -- },
--   -- omnisharp_mono = {},
--   lua_ls = {
--     inlay_hints = { enabled = true },
--   },
--   powershell_es = {
--     settings = {
--       powershell = {
--         codeFormatting = {
--           preset = 'OTBS',
--         },
--       },
--     },
--     -- settings = {
--     --   powershell = {
--     --     codeFormatting = {
--     --       preset = 'OTBS',
--     --       openBraceOnSameLine = true,
--     --     },
--     --   },
--     -- },
--   },
-- }

-- if present_mason then
--   -- print 'PRESENT MASON'
--   mason.setup {
--     ensure_installed = server_names,
--     -- handlers = {
--     --   powershell_es = function()
--     --     print 'IN POWERHSELL SSETUP'
--     --     lspconfig.powershell_es.setup {
--     --       bundle_path = '~/.local/share/nvim/lsp/PowerShellEditorServices',
--     --       on_attach = on_attach,
--     --       settings = {
--     --         powershell = {
--     --           codeFormatting = {
--     --             Preset = 'OTBS',
--     --           },
--     --         },
--     --       },
--     --     }
--     --   end,
--     -- },
--   }
--   mason.setup_handlers {
--     function(server)
--       print(server)
--       -- Set config for server
--       local merged_config = vim.tbl_deep_extend('force', default_lsp_config, server_configs[server] or {})
--       lspconfig[server].setup(merged_config)
--
--       -- Setup rust tools
--       if server == 'rust_analyzer' then
--         local present_rust_tools, rust_tools = pcall(require, 'rust-tools')
--         if present_rust_tools then
--           rust_tools.setup { server = merged_config }
--         end
--       end
--     end,
--   }
-- end
