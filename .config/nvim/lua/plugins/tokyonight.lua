return {
	-- TokyoNight colorscheme (see `:help tokyonight.nvim`)
	{
		'folke/tokyonight.nvim',
		priority = 1000, -- Load theme first
		config = function()
			require('tokyonight').setup {
				style = 'night',
				transparent = true,
				dim_inactive = false,
				lualine_bold = false,
				styles = {
					sidebars = 'transparent',
					floats = 'transparent',
				},
				on_colors = function(colors) end,
				on_highlights = function(highlights, colors)
					highlights.WinSeparator = { fg = '#414868', bg = '#1a1b26' }
					highlights.StatusLine = { bg = '#1a1b26' }
					highlights.StatusLineNC = { bg = '#1a1b26' }

					-- Minimal Telescope Borders
					highlights.TelescopeBorder = { fg = '#414868', bg = 'NONE' }
					highlights.TelescopePromptBorder = { fg = '#414868', bg = 'NONE' }
					highlights.TelescopeResultsBorder = { fg = '#414868', bg = 'NONE' }
					highlights.TelescopePreviewBorder = { fg = '#414868', bg = 'NONE' }
					highlights.TelescopePromptTitle = { fg = '#eab308', bg = 'NONE' }
					highlights.TelescopeResultsTitle = { fg = '#414868', bg = 'NONE' }
					highlights.TelescopePreviewTitle = { fg = '#414868', bg = 'NONE' }
				end,
			}
			vim.cmd.colorscheme 'tokyonight-night'
		end,
	},
}
