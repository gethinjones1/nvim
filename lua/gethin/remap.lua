vim.opt.number = true
vim.opt.relativenumber = true
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("n", "<leader>t", ":botright split | terminal<CR>")
vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]])
-- Always show the tabline
vim.o.showtabline = 2

-- Handy tab mappings
vim.keymap.set('n', '<leader>tn', ':tabnew<CR>', { desc = 'New tab' })
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = 'Close tab' })
vim.keymap.set('n', '<leader>to', ':tabonly<CR>', { desc = 'Close other tabs' })
vim.keymap.set('n', '<leader>tp', ':tabprevious<CR>', { desc = 'Prev tab' })
vim.keymap.set('n', '<leader>tN', ':tabnext<CR>', { desc = 'Next tab' })

-- Jump directly to tab 1..9
for i = 1, 9 do
	vim.keymap.set('n', ('<leader>%d'):format(i), i .. 'gt', { desc = 'Go to tab ' .. i })
end
-- Splits
vim.keymap.set('n', '<leader>sv', ':vsplit<CR>', { desc = 'Vertical split' })
vim.keymap.set('n', '<leader>sh', ':split<CR>', { desc = 'Horizontal split' })

-- Navigate splits quickly
-- Easier split navigation
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-l>', '<C-w>l')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')

vim.opt.clipboard = "unnamedplus"
vim.keymap.set("n", "<leader>a", "ggVG")
vim.keymap.set("n", "DD", '"+dd', { noremap = true, silent = true })
-- dd deletes without yanking (uses the black hole register)
vim.keymap.set("n", "dd", '"_dd', { noremap = true, silent = true })
