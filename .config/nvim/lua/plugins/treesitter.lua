return {
	-- Highlight, edit, and navigate code (see `:help nvim-treesitter`)
	{
		'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate',
		opts = {
			ensure_installed = {
				'bash',
				'go',
				'luadoc',
				'printf',
				'toml',
				'vimdoc',
				'json',
				'jsonc',
				'nginx',
				'javascript',
				'python',
				'php',
				'typescript',
				'tsx',
				'yaml',
				'html',
				'css',
				'prisma',
				'markdown',
				'markdown_inline',
				'lua',
				'vim',
				'dockerfile',
				'gitignore',
				'query',
			},
			auto_install = true, -- Autoinstall languages that are not installed
			highlight = {
				enable = true,
				use_languagetree = true,
			},
			indent = { enable = true },

			-- Incremental selection (see `:help nvim-treesitter-incremental-selection-mod`)
			incremental_selection = {
				enable = true,
				keymaps = {
					init_selection = 'gnn',
					node_incremental = 'grn',
					scope_incremental = 'grc',
					node_decremental = 'grm',
				},
			},
		},
	},
}

