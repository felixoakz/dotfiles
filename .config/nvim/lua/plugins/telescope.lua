return {
	-- Fuzzy Finder (files, lsp, etc) (see `:help telescope`)
	{
		'nvim-telescope/telescope.nvim',
		event = 'VimEnter',
		dependencies = {
			'nvim-lua/plenary.nvim',
			-- FZF Native for performance
			{
				'nvim-telescope/telescope-fzf-native.nvim',
				build = 'make',
				cond = function()
					return vim.fn.executable 'make' == 1
				end,
			},
			-- UI Select for better user experience
			{ 'nvim-telescope/telescope-ui-select.nvim' },
			-- Web Devicons for pretty icons
			{ 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
		},
		config = function()
			require('telescope').setup {
				defaults = {
					-- Your default mappings / updates / etc.
				},
				extensions = {
					['ui-select'] = {
						require('telescope.themes').get_dropdown(),
					},
				},
			}

			-- Load Telescope extensions
			pcall(require('telescope').load_extension, 'fzf')
			pcall(require('telescope').load_extension, 'ui-select')

			local builtin = require 'telescope.builtin'
			vim.keymap.set('n', '<leader>sf', function()
				builtin.find_files { show_untracked = true }
			end, { desc = 'Find files (incl. untracked)' })

			vim.keymap.set('n', '<leader>sr', function()
				builtin.oldfiles { cwd = vim.fn.getcwd() }
			end, { desc = 'Recent files (cwd)' })

			vim.keymap.set('n', '<leader>sg', function()
				builtin.live_grep { additional_args = { '--fixed-strings' } }
			end, { desc = 'Grep in project' })

			vim.keymap.set('n', '<leader>sl', builtin.resume, { desc = 'Last search' })
			vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Current word' })
			vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Active keymaps' })
			vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Diagnostics' })
			vim.keymap.set('n', '<leader><leader>', builtin.buffers, { desc = 'Buffer List' })
			vim.keymap.set('n', '<leader>sT', builtin.builtin, { desc = 'List Telescope commands' })
			vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Help tags' })

			vim.keymap.set('n', '<leader>/', function()
				builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					winblend = 10,
					previewer = false,
				})
			end, { desc = 'Fuzzy search current buffer' })

			vim.keymap.set('n', '<leader>s/', function()
				builtin.live_grep {
					grep_open_files = true,
					prompt_title = ' Live Grep in Open Files',
				}
			end, { desc = 'Live Grep in Open Files' })

			vim.keymap.set('n', '<leader>.', function()
				builtin.find_files { cwd = vim.fn.stdpath 'config' }
			end, { desc = 'Neovim config files' })
		end,
	},
}
