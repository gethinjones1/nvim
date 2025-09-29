-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- ~/.config/nvim/lua/config/keymaps.lua
local map = vim.keymap.set
local silent = { silent = true, noremap = true }

-- Explorer (netrw)
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open netrw (project view)" })

-- Select all
map("n", "<leader>a", "ggVG", silent)

-- Terminal: open bottom split
map("n", "<leader>t", ":botright split | terminal<CR>", { desc = "Terminal (bottom split)", silent = true })
-- Escape to normal-mode from terminal
map("t", "<Esc>", [[<C-\><C-n>]], silent)

-- Splits
map("n", "<leader>sv", ":vsplit<CR>", { desc = "Vertical split", silent = true })
map("n", "<leader>sh", ":split<CR>", { desc = "Horizontal split", silent = true })

-- Navigate splits quickly (these match LazyVim defaults; defining again is fine)
map("n", "<C-h>", "<C-w>h", silent)
map("n", "<C-l>", "<C-w>l", silent)
map("n", "<C-j>", "<C-w>j", silent)
map("n", "<C-k>", "<C-w>k", silent)

-- Clipboard helpers / delete behavior
-- Delete line to system clipboard with DD
map("n", "DD", '"+dd', { noremap = true, silent = true, desc = "Delete line to system clipboard" })
-- Make `dd` NOT yank (black-hole)
map("n", "dd", '"_dd', { noremap = true, silent = true, desc = "Delete line without yanking" })
