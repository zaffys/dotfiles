local status, cmp = pcall(require, "cmp")
local lspkind = require('lspkind')

if (not status) then return end

vim.opt.completeopt = "menu,menuone,noselect"

cmp.setup({
  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, vim_item)
      vim_item.kind = lspkind.presets.default[vim_item.kind]
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
      }
      vim_item.menu = ({
        look = "[Dict]",
        buffer = "[Buffer]",
        nvim_lsp = "[LSP]",
        nvim_lua = "[Lua]",
        treesitter = "[TS]",
        vsnip = "[VSnip]",
      })[entry.source.name]
      vim_item.menu = menu_icon[entry.source.name]

      vim_item.kind, vim_item.menu = vim_item.menu, vim_item.kind
      return vim_item
    end
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-]>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
  },
  sources = cmp.config.sources({
    { name = 'path' },
    { name = 'nvim_lsp', keyword_length = 3 },
    { name = 'nvim_lua', keyword_length = 3 },
    { name = 'treesitter' },
    { name = 'vsnip', keyword_length = 2 },
  }, {
    { name = 'buffer' },
  })
})

cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
