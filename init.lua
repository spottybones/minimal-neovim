vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.signcolumn = "yes"
vim.opt.wrap = false
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.o.winborder = "rounded"

vim.g.mapleader = " "

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "<leader>w", ":write<CR>")
vim.keymap.set("n", "<leader>q", ":quit<CR>")
vim.keymap.set({ "i", "v" }, "jk", "<ESC>")

-- Use vim.pack.add() to install plugins if not using NixCats
if not vim.g[ [[nixCats-special-rtp-entry-nixCats]] ] then
    vim.pack.add({
        { src = "https://github.com/folke/tokyonight.nvim" },
        { src = "https://github.com/nvim-mini/mini.nvim" },
        { src = "https://github.com/neovim/nvim-lspconfig" },
        { src = "https://github.com/folke/snacks.nvim" },
        { src = "https://github.com/nvim-tree/nvim-web-devicons" },
        { src = "https://github.com/j-hui/fidget.nvim" },
    })
end

require("snacks").setup({
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
})
require("mini.pick").setup()
require("mini.statusline").setup()
require("mini.tabline").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("fidget").setup({})

-- keymaps for pickers
vim.keymap.set("n", "<leader>f", Snacks.picker.smart)
vim.keymap.set("n", "<leader>e", Snacks.picker.explorer)
vim.keymap.set("n", "<leader>h", Snacks.picker.help)
vim.keymap.set("n", "<leader>g", function() Snacks.lazygit() end)
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end)

-- set up Lua LSP
vim.lsp.enable({ "lua_ls", "nixd" })
vim.keymap.set({ "n" }, "<leader>cf", vim.lsp.buf.format)

-- colorscheme
vim.cmd("colorscheme tokyonight-moon")
