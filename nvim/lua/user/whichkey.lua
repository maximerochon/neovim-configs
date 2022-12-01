require("which-key").setup({
    plugins = {
        marks = false,
        registers = false,
        spelling = {
            enabled = false,
            suggestions = 20,
        },
        presets = {
            operators = false,
            motions = false,
            text_objects = false,
            windows = false,
            nav = false,
            z = false,
            g = false,
        },
    },
    operators = { gc = "Comments" },
    key_labels = {},
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
    },
    popup_mappings = {
        scroll_down = "<c-d>",
        scroll_up = "<c-u>",
    },
    window = {
        border = "none",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
    },
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
    },
    ignore_missing = true,
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " },
    show_help = false,
    show_keys = false,
    triggers = "auto",
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },
    disable = {
        buftypes = {},
        filetypes = { "TelescopePrompt" },
    },
})

local wk = require("which-key")

wk.register({
    f = {
        name = "File",
        d = { "File browser" },
        f = { "Find file" },
        g = { "Live grep" },
        r = { "<cmd>Telescope oldfiles<cr>", "Open recent file" },
        b = { "File buffers" },
    },
    g = {
        name = "Git",
        c = { "Lazygit current file" },
        g = { "Lazygit" },
    },
    t = {
        name = "Terraform",
        i = { "<cmd>!terraform init<CR>", "Terraform init" },
        v = { "<cmd>!terraform validate<CR>", "Terraform validate" },
        p = { "<cmd>!terraform plan<CR>", "Terraform plan" },
        a = { "<cmd>!terraform apply", "Terraform apply" },
    },
    w = {
        name = "Write",
        f = { "<cmd>Format<CR>", "Format" },
        w = { "<cmd>w<CR>", "Write" },
        t = { "<cmd>FormatWrite<CR>", "Format and write" },
    },
    m = { "<cmd>Telescope<CR>", "Menu" },
}, { prefix = "<leader>" })

