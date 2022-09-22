--
-- Global Configuration
--
require('mason').setup()
require('mason-lspconfig').setup()

local lsp_defaults = {
  flags = {
    debounce_text_changes = 150,
  },
--  capabilities = require('cmp_nvim_lsp').update_capabilities(
--    vim.lsp.protocol.make_client_capabilities()
--  ),
  on_attach = function(client, bufnr)
    vim.api.nvim_exec_autocmds('User', {pattern = 'LspAttached'})
  end
}

local lspconfig = require('lspconfig')

lspconfig.util.default_config = vim.tbl_deep_extend(
  'force',
  lspconfig.util.default_config,
  lsp_defaults
)

--
-- LSP Server Configuration
--
lspconfig.sumneko_lua.setup({})
