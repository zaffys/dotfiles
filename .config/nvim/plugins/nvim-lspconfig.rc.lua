-- nvim-lspconfig
local on_attach = function(_, bufnr)
  -- Enable to insert imported library for golang
  function OrgImports(wait_ms)
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
    for _, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
        else
          vim.lsp.buf.execute_command(r.command)
        end
      end
    end
  end

  vim.api.nvim_command [[autocmd BufWritePre *.go lua OrgImports(100)]]
  vim.api.nvim_command [[autocmd BufWritePre *.go lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  vim.api.nvim_command [[autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 1000)]]
  vim.api.nvim_command [[autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_sync(nil, 1000)]]

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-[>', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-]>', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-t>', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', ',f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ",r", "<cmd>Lspsaga rename<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ",a", "<cmd>Lspsaga code_action<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "x", ",x", ":<c-u>Lspsaga range_code_action<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", ",e", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
end

-- nvim-lsp-installer
local lsp_installer_servers = require('nvim-lsp-installer.servers')
local servers = { 'emmet_ls', 'solargraph', 'spectral', 'sumneko_lua', 'vuels', 'dockerls', 'eslint', 'tsserver', 'diagnosticls', 'gopls', 'golangci_lint_ls' }
for _, server_name in pairs(servers) do
  local server_available, server = lsp_installer_servers.get_server(server_name)
  if server_available then
    server:on_ready(function ()
      -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
      -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
      -- function to set up servers, to avoid doing setting up a server twice.
      local opts = {}
      opts.on_attach = on_attach
      opts.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

      server:setup(opts)
    end)
    if not server:is_installed() then
      -- Queue the server to be installed
      server:install()
    end
  end
end

-- diagnosticls
require('lspconfig').diagnosticls.setup {
  on_attach = on_attach,
  filetypes = { 'javascript', 'javascriptreact', 'json', 'typescript', 'typescriptreact', 'ruby', 'css', 'less', 'scss', 'markdown', 'vue' },
  init_options = {
    linters = {
      eslint = {
        command = 'eslint_d',
        rootPatterns = { '.git' },
        debounce = 100,
        args = { '--stdin', '--stdin-filename', '%filepath', '--format', 'json' },
        sourceName = 'eslint_d',
        parseJson = {
          errorsRoot = '[0].messages',
          line = 'line',
          column = 'column',
          endLine = 'endLine',
          endColumn = 'endColumn',
          message = '[eslint] ${message} [${ruleId}]',
          security = 'severity'
        },
        securities = {
          [2] = 'error',
          [1] = 'warning'
        }
      },
      rubocop = {
        command = 'bundle',
        args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "%filepath" },
        debounce = 100,
        sourceName = 'rubocop',
        parseJson = {
          errorsRoot = "files[0].offenses",
          line = "location.line",
          column = "location.column",
          message = "[${cop_name}] ${message}",
          security = "severity"
        },
        securities = {
          fatal = 'error',
          warning = 'warning'
        }
      }
    },
    filetypes = {
      javascript = 'eslint',
      javascriptreact = 'eslint',
      typescript = 'eslint',
      typescriptreact = 'eslint',
      ruby = 'rubocop'
    },
    formatters = {
      eslint_d = {
        command = 'eslint_d',
        args = { '--stdin', '--stdin-filename', '%filename', '--fix-to-stdout' },
        rootPatterns = { '.git' },
      },
      prettier = {
        command = 'prettier',
        args = { '--stdin-filepath', '%filename' }
      },
      rubocop = {
        command = 'bundle',
        args = { 'exec', 'rubocop', '-a', '--stderr', '--stdin', '%filepath' }
      }
    },
    formatFiletypes = {
      css = 'prettier',
      javascript = 'eslint_d',
      javascriptreact = 'eslint_d',
      json = 'prettier',
      scss = 'prettier',
      less = 'prettier',
      typescript = 'eslint_d',
      typescriptreact = 'eslint_d',
      ruby = 'rubocop',
      vue = 'eslint_d',
      markdown = 'prettier',
    }
  }
}
-- diagnostics-icon
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = true,
    virtual_text = {
      spacing = 4,
      prefix = ''
    }
  }
)

-- lua-language-server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

require('lspconfig').sumneko_lua.setup {
  on_attach = on_attach,
  settings = {
    Lua = {
      runtime = {
        version = 'LuaJIT',
        path = runtime_path,
      },
      diagnostics = {
        globals = {'vim'},
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
      },
      telemetry = {
        enable = false,
      },
    },
  },
}

-- solargraph
require'lspconfig'.solargraph.setup{
  on_attach = on_attach,
  cmd = { "solargraph", "stdio" },
  filetypes = { "ruby" },
  init_options = {
    formatting = false
  },
  root_dir = require'lspconfig.util'.root_pattern("Gemfile", ".git"),
  settings = {
    solargraph = {
      diagnostics = false
    }
  }
}

-- gopls
require'lspconfig'.gopls.setup {
  cmd = {"gopls", "serve"},
  filetypes = {"go", "gomod"},
  root_dir = require'lspconfig.util'.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
    },
  },
}
