return {
	-- Adds git signs to the gutter and provides utilities for managing changes (see `:help gitsigns.nvim`)
	{
		'lewis6991/gitsigns.nvim',
		opts = {

			signs = {
				add = { text = '+' },
				change = { text = '~' },
				delete = { text = '_' },
				topdelete = { text = '‾' },
				changedelete = { text = '~' },
			},

			on_attach = function(bufnr)
				local gitsigns = require 'gitsigns'

				local function map(mode, l, r, opts)
					opts = opts or {}
					opts.buffer = bufnr
					vim.keymap.set(mode, l, r, opts)
				end

				-- Navigation
				map('n', ']c', function()
					if vim.wo.diff then
						vim.cmd.normal { ']c', bang = true }
					else
						gitsigns.nav_hunk 'next'
					end
				end, { desc = 'Jump to next git change' })

				map('n', '[c', function()
					if vim.wo.diff then
						vim.cmd.normal { '[c', bang = true }
					else
						gitsigns.nav_hunk 'prev'
					end
				end, { desc = 'Jump to previous git change' })

				-- Actions
				map('n', '<leader>gp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
				map('n', '<leader>gb', gitsigns.blame_line, { desc = 'Blame line' })
				map('n', '<leader>gi', gitsigns.diffthis, { desc = 'Diff against index' })
				map('n', '<leader>gc', function()
					gitsigns.diffthis '@'
				end, { desc = 'Diff against last commit' })

				vim.keymap.set('n', '<leader>gd', function()
					require('telescope.builtin').git_bcommits {
						attach_mappings = function(_, map)
							map('i', '<CR>', function(prompt_bufnr)
								local entry = require('telescope.actions.state').get_selected_entry()
								require('telescope.actions').close(prompt_bufnr)
								require('gitsigns').diffthis(entry.value)
							end)
							return true
						end,
					}
				end, { desc = 'Git diff buffer vs commit' })

				map('n', '<leader>gB', gitsigns.toggle_current_line_blame, { desc = 'Toggle Blame line' })
				map('n', '<leader>gh', '<cmd>Telescope git_bcommits<CR>', { desc = 'Git file history' })
			end,
		},
	},
}

