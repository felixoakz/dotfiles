return {
	'stevearc/conform.nvim',

	opts = {
		notify_on_error = true, -- So you can see any errors from the formatters
		format_on_save = nil, -- Disable format on save
		formatters_by_ft = {
			lua = { 'stylua' },
			python = { 'ruff' },
			php = { 'pint' },
			go = { 'gofumpt', 'goimports-reviser' },
			javascript = { 'prettier' },
			typescript = { 'prettier' },
			javascriptreact = { 'prettier' },
			typescriptreact = { 'prettier' },
			vue = { 'prettier' },
			css = { 'prettier' },
			scss = { 'prettier' },
			less = { 'prettier' },
			html = { 'prettier' },
			json = { 'prettier' },
			yaml = { 'prettier' },
			markdown = { 'prettier' },
		},
	},
	config = function(_, opts)
		require('conform').setup(opts)

		-- Manual formatting keymap
		vim.keymap.set({ 'n', 'v' }, '<leader>f', function()
			require('conform').format { lsp_fallback = true, async = false, timeout_ms = 500 }
		end, { desc = 'Format file or range' })
	end,
}

