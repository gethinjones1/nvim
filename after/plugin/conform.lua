
require('conform').setup({
  formatters_by_ft = {
    javascript = { 'prettier' },
    javascriptreact = { 'prettier' },
    typescript = { 'prettier' },
    typescriptreact = { 'prettier' },
    html = { 'prettier' },
    css = { 'prettier' },
    json = { 'prettier' },
    markdown = { 'prettier' },
    -- PHP: keep a PHP formatter separate from Prettier
    php = { 'pint', 'php_cs_fixer', 'phpcbf' }, -- will use first available
  },
  format_on_save = {
    lsp_fallback = true,
    timeout_ms = 2000,
  },
})
-- manual keybind too
vim.keymap.set('n', '<leader>f', function() require('conform').format({ async = true }) end, { desc = 'Format buffer' })
