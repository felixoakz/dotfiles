return {
	-- Enhanced Neovim messages, cmdline, and popups (see `:help noice.nvim`)
	'folke/noice.nvim',
	event = 'VeryLazy',
	opts = {
		cmdline = {
			enabled = true,
			view = 'cmdline_popup',
			opts = {
				border = {
					style = 'rounded',
				},
			},
		},
		popupmenu = {
			enabled = true,
			backend = 'cmp',
			kind_icons = {},
		},
		lsp = {
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
			},
		},
		views = {
			cmdline_popup = {
				border = {
					style = 'rounded',
				},
				filter_options = {},
				win_options = {
					winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder',
				},
			},
			popupmenu = {
				relative = 'editor',
				position = {
					row = 'auto',
					col = 'auto',
				},
				size = {
					width = 'auto',
					height = 'auto',
				},
				border = {
					style = 'rounded',
					padding = { 0, 1 },
				},
				win_options = {
					winhighlight = {
						Normal = 'Pmenu',
						FloatBorder = 'Pmenu',
						CursorLine = 'PmenuSel',
						Search = 'Pmenu',
					},
					winblend = 0,
				},
			},
		},
		routes = {
			{
				filter = {
					event = 'msg_show',
					kind = 'search_count',
				},
				opts = { skip = true },
			},
		},
	},
	dependencies = {
		'MunifTanjim/nui.nvim',
		'rcarriga/nvim-notify', -- Optional: for notification view
	},
}