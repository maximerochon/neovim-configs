local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
    return
end

configs.setup({
    ensure_installed = {
        "vim",
        "help",
        "bash",
        "c",
        "javascript",
        "json",
        "lua",
        "python",
        "typescript",
        "tsx",
        "css",
        "rust",
        "java",
        "yaml",
        "markdown",
        "markdown_inline",
        "hcl",
    },
    ignore_install = { "phpdoc" },
    highlight = {
        enable = true,
        disable = { "css" },
    },
    autopairs = {
        enable = true,
    },
    autotag = {
        enable = true,
    },
    indent = { enable = true, disable = { "python", "css", "yaml" } },
})
