-- Mason
require('mason').setup()
require('mason-lspconfig').setup({
	ensure_installed = {
		'intelephense',
		'eslint',
		'html',
		-- JS language features; some configs renamed tsserver → ts_ls
		'tsserver',
		'ts_ls',
	},
	automatic_installation = true,
})

-- Capabilities from nvim-cmp
local has_cmp, cmp_lsp = pcall(require, 'cmp_nvim_lsp')
local capabilities = has_cmp and cmp_lsp.default_capabilities()
    or vim.lsp.protocol.make_client_capabilities()

-- Keymaps
local on_attach = function(_, bufnr)
	-- ensure omni completion works (<C-x><C-o>)
	vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

	local map = function(m, lhs, rhs)
		vim.keymap.set(m, lhs, rhs, { buffer = bufnr, silent = true, noremap = true })
	end
	map('n', 'gd', vim.lsp.buf.definition)
	map('n', 'gr', vim.lsp.buf.references)
	map('n', 'gi', vim.lsp.buf.implementation)
	map('n', 'K', vim.lsp.buf.hover)
	map('n', '<leader>rn', vim.lsp.buf.rename)
	map('n', '<leader>ca', vim.lsp.buf.code_action)
	map('n', '[d', vim.diagnostic.goto_prev)
	map('n', ']d', vim.diagnostic.goto_next)
end

local util = require('lspconfig.util')
local configs = require('lspconfig.configs')
local TS_NAME = (configs.ts_ls and 'ts_ls') or 'tsserver'

-- PHP: Intelephense
vim.lsp.config['intelephense'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	settings = {
		intelephense = {
			environment = { phpVersion = '8.2' },
			files = { maxSize = 5000000 },
			telemetry = { enabled = false },
		},
	},
}
vim.lsp.enable('intelephense')

-- JavaScript/TypeScript language features
vim.lsp.config[TS_NAME] = {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
	root_dir = util.root_pattern('tsconfig.json', 'jsconfig.json', 'package.json', '.git'),
	single_file_support = true,
}
vim.lsp.enable(TS_NAME)

-- ESLint (linting for JS/TS)
vim.lsp.config['eslint'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	root_dir = util.root_pattern(
		'.eslintrc', '.eslintrc.json', '.eslintrc.js', '.eslintrc.cjs',
		'eslint.config.js', 'eslint.config.cjs', 'package.json', '.git'
	),
	settings = {
		workingDirectories = { { mode = 'auto' } },
		-- experimental = { useFlatConfig = true }, -- enable if on ESLint v9 flat config
		format = false,
	},
}
vim.lsp.enable('eslint')

-- HTML
vim.lsp.config['html'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	filetypes = { 'html' },
	root_dir = util.root_pattern('package.json', '.git', '.editorconfig'),
}
vim.lsp.enable('html')

-- Diagnostics UI (optional)
vim.diagnostic.config({ virtual_text = false, float = { border = 'rounded' } })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)

-- Go: gopls
vim.lsp.config['gopls'] = {
	on_attach = on_attach,
	capabilities = capabilities,
	cmd = { 'gopls' },
	filetypes = { 'go', 'gomod', 'gowork', 'gotmpl' },
	root_dir = util.root_pattern('go.work', 'go.mod', '.git'),
	settings = {
		gopls = {
			usePlaceholders = true,
			completeUnimported = true,
			staticcheck = true, -- enable Staticcheck diagnostics
			gofumpt = true, -- format with gofumpt if available
			analyses = {
				unusedparams = true,
				shadow = true,
				nilness = true,
			},
			hints = {
				assignVariableTypes = true,
				compositeLiteralFields = true,
				compositeLiteralTypes = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
			directoryFilters = { "-**/node_modules", "-**/vendor" },
		},
	},
}
vim.lsp.enable('gopls')
