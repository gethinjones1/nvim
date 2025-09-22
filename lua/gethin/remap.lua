vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("n", "<leader>t", ":botright split | terminal<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
