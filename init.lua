vim.o.autoindent = true
vim.o.cursorline = true
vim.o.expandtab = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 10
vim.o.shiftwidth = 4
vim.o.signcolumn = "yes"
vim.o.swapfile = false
vim.o.tabstop = 4
vim.o.winborder = "rounded"
vim.o.wrap = false

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":qall<CR>")
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")

-- Use vim.pack.add() to install plugins if not using NixCats
if not vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] then
    vim.pack.add({
        { src = "https://github.com/akinsho/bufferline.nvim" },
        { src = "https://github.com/folke/snacks.nvim" },
        { src = "https://github.com/folke/tokyonight.nvim" },
        { src = "https://github.com/folke/which-key.nvim/" },
        { src = "https://github.com/j-hui/fidget.nvim" },
        { src = "https://github.com/nvim-lualine/lualine.nvim" },
        { src = "https://github.com/nvim-mini/mini.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter" },
        { src = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects" },
        { src = "https://github.com/stevearc/conform.nvim" },
    })
end

require("mini.basics").setup({
    mappings = {
        windows = true,
    }
})
require("mini.pick").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("fidget").setup({})

-- set up Lua LSP
vim.lsp.enable({ "lua_ls", "nixd" })
if nixCats("pydev") then
    -- if the pydev category is enabled, load python LSPs
    vim.lsp.enable({ "basedpyright", "ruff" })
end
vim.keymap.set({ "n" }, "<leader>cf", vim.lsp.buf.format, { desc = "Code Format" })
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })

-- colorscheme
vim.cmd("colorscheme tokyonight-moon")

-- set up Treesitter options
---@diagnostic disable-next-line: missing-fields
require("nvim-treesitter.configs").setup({
    highlight = { enable = true },
    indent = { enable = true },
})

-- set up lualine
require("lualine").setup({})

-- set up which-key
local wk = require("which-key")
wk.setup({
    preset = "helix"
})
wk.add({
    { "<leader>b", group = "buffer" },
    { "<leader>c", group = "code" }
})
