local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files)
vim.keymap.set('n', '<C-p>', builtin.git_files)
vim.keymap.set('n', '<leader>ps', builtin.live_grep, { desc = "Live grep" })
vim.keymap.set('n', '<leader>pb', require('telescope.builtin').current_buffer_fuzzy_find,
	{ desc = "Search in current buffer" })
