-- Snacks configuration

require("snacks").setup({
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
})

-- keymaps for pickers
vim.keymap.set("n", "<leader>f", Snacks.picker.smart)
vim.keymap.set("n", "<leader>e", Snacks.picker.explorer)
vim.keymap.set("n", "<leader>h", Snacks.picker.help)
vim.keymap.set("n", "<leader>g", function() Snacks.lazygit() end)
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end)
