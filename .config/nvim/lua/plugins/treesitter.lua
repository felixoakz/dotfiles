-- Languages to install
local ensure_installed = {
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
}

return {
	-- Highlight, edit, and navigate code (see `:help nvim-treesitter`)
	{
		'nvim-treesitter/nvim-treesitter',
		branch = 'master',
		lazy = false,
		build = function()
			require('nvim-treesitter').install(ensure_installed)
		end,
		config = function()
			-- Enable treesitter highlighting (built into Neovim, just needs parsers)
			vim.api.nvim_create_autocmd('FileType', {
				callback = function()
					pcall(vim.treesitter.start)
				end,
			})

			-- Install missing parsers on startup
			local installed = require('nvim-treesitter').get_installed()
			local to_install = vim.tbl_filter(function(lang)
				return not vim.tbl_contains(installed, lang)
			end, ensure_installed)

			if #to_install > 0 then
				require('nvim-treesitter').install(to_install)
			end
		end,
	},
}

