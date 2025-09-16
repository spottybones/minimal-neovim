local lint = require("lint")

lint.linters_by_ft.sh = { "shellcheck" }
lint.linters_by_ft.bash = { "shellcheck" }

if nixCats("pydev") then
    lint.linters_by_ft.python = { "ruff" }
end

if nixCats("sql") then
    lint.linters_by_ft.sql = { "sqlfluff" }
    lint.linters.sqlfluff.args = { "lint", "--format=json" }
end

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
    callback = function()
        lint.try_lint()
    end,
})
