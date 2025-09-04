-- Snacks configuration

require("snacks").setup({
    statuscolumn = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
    explorer = {
        enabled = true,
        replace_netrw = true
    },
    indent = { enabled = true }
})

-- keymaps for pickers
vim.keymap.set("n", "<leader>f", Snacks.picker.smart, { desc = "Pick Files" })
vim.keymap.set("n", "<leader>e", Snacks.picker.explorer, { desc = "File Explorer" })
vim.keymap.set("n", "<leader>h", Snacks.picker.help, { desc = "Pick Help" })
vim.keymap.set("n", "<leader>u", Snacks.picker.buffers, { desc = "Pick Buffers" })
vim.keymap.set("n", "<leader>k", Snacks.picker.keymaps, { desc = "Pick Keymaps" })
vim.keymap.set("n", "<leader>g", function() Snacks.lazygit() end, { desc = "LazyGit" })
vim.keymap.set("n", "<leader>bd", function() Snacks.bufdelete() end, { desc = "Delete Buffer" })
