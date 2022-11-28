-- Ansible
-- npm install -g @ansible/ansible-language-server
require'lspconfig'.ansiblels.setup{}

-- Arduino
-- go install github.com/arduino/arduino-language-server@latest
--require'lspconfig'.arduino_language_server.setup {
--  cmd = {
--    "arduino-language-server",
--    "-cli-config", "/path/to/arduino-cli.yaml",
--    "-fqbn", "arduino:avr:uno",
--    "-cli", "arduino-cli",
--    "-clangd", "clangd"
--  }
--}

-- Astro
-- npm install -g @astrojs/language-server
require'lspconfig'.astro.setup{}

-- Bash
-- npm i -g bash-language-server
require'lspconfig'.bashls.setup{}

-- CSS
-- npm i -g vscode-langservers-extracted
--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

-- Docker
-- npm install -g dockerfile-language-server-nodejs
require'lspconfig'.dockerls.setup{}

-- Emmet
-- npm install -g emmet-ls
require'lspconfig'.emmet_ls.setup{}

-- Eslint
-- npm i -g vscode-langservers-extracted
require'lspconfig'.eslint.setup{}

-- Go
-- go install github.com/nametake/golangci-lint-langserver@latest
-- go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
require'lspconfig'.golangci_lint_ls.setup{}

-- Graphql
-- npm install -g graphql-language-service-cli
require'lspconfig'.graphql.setup{}

-- HTML
-- npm i -g vscode-langservers-extracted
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
require'lspconfig'.html.setup{}

-- JSON
-- npm i -g vscode-langservers-extracted
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.jsonls.setup {
  capabilities = capabilities,
}
-- LUA
-- Install lua-language-server
require'lspconfig'.sumneko_lua.setup{}

-- Python
-- npm install -g pyright
require'lspconfig'.pyright.setup{}

-- Svelte
-- npm install -g svelte-language-server
require'lspconfig'.svelte.setup{}

-- Tailwindcss
-- npm install -g @tailwindcss/language-server
require'lspconfig'.tailwindcss.setup{}

-- Terraform
-- Install terraform-ls, tflint
require'lspconfig'.terraformls.setup{}
require'lspconfig'.tflint.setup{}

-- Typescript
-- npm install -g typescript typescript-language-server
require'lspconfig'.tsserver.setup{}

-- Vue
-- npm install -g vls
require'lspconfig'.vuels.setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
require('lspconfig')['pyright'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require('lspconfig')['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}

