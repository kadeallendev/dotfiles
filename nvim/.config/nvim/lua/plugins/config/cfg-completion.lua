local lspkind = require 'lspkind'
lspkind.init {}

local cmp = require 'cmp'
local luasnip = require 'luasnip'

-- vim.api.nvim_set_hl(0, 'CmpNormal', { bg = '#000000' })

cmp.setup {
  formatting = {
    format = lspkind.cmp_format(),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
    { name = 'treesitter' },
    { name = 'luasnip' },
    arg,
    -- { name = 'nvim_lsp_signature_help' },
    -- { name = 'nvim_lua'},
  },
  window = {
    completion = {
      border = 'solid',
    },
    documentation = {
      border = 'solid',
      winhighlight = 'Normal:Pmenu,FloatBorder:Pmenu',
    },
  },
  mapping = {
    -- Next Item
    ['<C-n>'] = cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Insert },
    -- Prev Item
    ['<C-p>'] = cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Insert },
    -- Confirm Item
    ['<C-y>'] = cmp.mapping(
      cmp.mapping.confirm {
        -- TODO: maybe use Replace
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      },
      { 'i', 'c' }
    ),

    -- Scroll down in docs
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),

    -- Next item in luasnip
    ['<C-l>'] = cmp.mapping(function()
      if luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      end
    end, { 'i', 's' }),

    -- Previous item in luasnip
    ['<C-h>'] = cmp.mapping(function()
      if luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      end
    end, { 'i', 's' }),
  },

  snippet = {
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },
}

luasnip.config.set_config {
  history = false,
  updateevents = 'TextChanged,TextChangedI',
}

for _, ft_path in ipairs(vim.api.nvim_get_runtime_file('lua/kade/snippets/*.lua', true)) do
  loadfile(ft_path)()
end

-- Insert parentheses
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())
