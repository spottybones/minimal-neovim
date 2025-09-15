require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" }
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
    default_format_opts = {
        lsp_format = "fallback"
    }
})
