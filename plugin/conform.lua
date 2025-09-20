local conform = require("conform")

local my_formatters_by_ft = {}
local my_formatters = {}

my_formatters_by_ft.lua = { "stylua" }
my_formatters_by_ft.nix = { lsp_format = "fallback" }
my_formatters_by_ft._ = { "trim_whitespace" }
my_formatters_by_ft.sh = { "shellcheck", "shfmt" }
my_formatters_by_ft.bash = { "shellcheck", "shfmt" }
my_formatters_by_ft.just = { "just" }

if nixCats("pydev") then
    my_formatters_by_ft.python = { "ruff_format", "ruff_organize_imports" }
end

if nixCats("sql") then
    my_formatters_by_ft.sql = { "sqlfluff" }
    my_formatters.sqlfluff = { "format", "-" }
end

if nixCats("clangd") then
    my_formatters_by_ft.cpp = { "clang-format" }
end

conform.setup({
    formatters_by_ft = my_formatters_by_ft,
    formatters = my_formatters,
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    default_format_opts = {
        lsp_format = "fallback",
    },
})
