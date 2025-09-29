return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.8',
		-- or                            , branch = '0.1.x',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}
	use({
		"rose-pine/neovim",
		as = "rose-pine",
		config = function()
			vim.cmd("colorscheme rose-pine")
		end
	})
	use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
	use('nvim-treesitter/playground')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
	use("wbthomason/packer.nvim")
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim", { run = ":MasonUpdate" })
	use("williamboman/mason-lspconfig.nvim")
	use('hrsh7th/nvim-cmp') -- completion engine UI
	use('hrsh7th/cmp-nvim-lsp') -- LSP source for nvim-cmp
	use('hrsh7th/cmp-buffer') -- buffer words
	use('hrsh7th/cmp-path') -- filesystem paths

	-- (optional but nice) snippets so LSP can expand placeholders:
	use('L3MON4D3/LuaSnip')
	use('saadparwaiz1/cmp_luasnip')
	use('stevearc/conform.nvim')
	use('rafamadriz/friendly-snippets')
	use('mg979/vim-visual-multi', { branch = 'master' })
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup {}
		end
	})
end)
