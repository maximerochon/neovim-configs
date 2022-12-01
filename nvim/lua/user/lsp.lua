local ok_lsp, lsp = pcall(require, "lspconfig")
local ok_cmp, cmp = pcall(require, "cmp")
local ok_cmp_lsp, cmp_lsp = pcall(require, "cmp_nvim_lsp")

local servers = {
    "ansiblels",
    "astro",
    "bashls",
    "cssls",
    "dockerls",
    "emmet_ls",
    "eslint",
    "golangci_lint_ls",
    "graphql",
    "html",
    "jsonls",
    "sumneko_lua",
    "pyright",
    "svelte",
    "tailwindcss",
    "terraformls",
    "tflint",
    "tsserver",
    "vuels",
}

local server_settings = {}

local lsp_flags = {
    debounce_text_changes = 150,
}

-- Mappings.
local opts = { noremap = true, silent = true }
vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- Mappings.
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
    vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
    vim.keymap.set("n", "<space>wl", function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "<space>f", function()
        vim.lsp.buf.format({ async = true })
    end, bufopts)
end

-- capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.default_capabilities(capabilities)

for _, server in pairs(servers) do
    if server == "rust_analyzer" then
        rust_tools.setup({ tools = { on_initialized = on_attach } })
    else
        lsp[server].setup({
            capabilities = capabilities,
            on_attach = on_attach,
            settings = server_settings[server],
            flags = lsp_flags,
        })
    end
end

--require'lspconfig'.arduino_language_server.setup {
--  cmd = {
--    "arduino-language-server",
--    "-cli-config", "/path/to/arduino-cli.yaml",
--    "-fqbn", "arduino:avr:uno",
--    "-cli", "arduino-cli",
--    "-clangd", "clangd"
--  }
--}

