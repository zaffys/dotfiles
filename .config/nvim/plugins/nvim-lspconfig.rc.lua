local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  if client.resolved_capabilities.document_formatting then
    vim.api.nvim_command [[augroup Format]]
    vim.api.nvim_command [[autocmd! * <buffer>]]
    vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
    vim.api.nvim_command [[augroup END]]
  end

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
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>r", "<cmd>Lspsaga rename<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gx", "<cmd>Lspsaga code_action<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "x", "gx", ":<c-u>Lspsaga range_code_action<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "K",  "<cmd>Lspsaga hover_doc<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "go", "<cmd>Lspsaga show_line_diagnostics<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-u>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", opts)
end

local lsp_installer_servers = require('nvim-lsp-installer.servers')
local servers = {
  'emmet_ls', 'solargraph', 'spectral', 'sumneko_lua', 'volar', 'dockerls', 'eslint', 'tsserver', 'diagnosticls'
}

-- Loop through the servers listed above.
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
