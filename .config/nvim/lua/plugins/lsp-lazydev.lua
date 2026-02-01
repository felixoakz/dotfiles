return {
	-- Lazydev: Lua LSP for Neovim config and plugins (see `:help lazydev.nvim`)
	{
		'folke/lazydev.nvim',
		ft = 'lua',
		opts = {
			library = {
				{ path = 'luvit-meta/library', words = { 'vim%.uv' } },
			},
		},
	},
	-- Luvit-meta: Dependency for lazydev.nvim
	{ 'Bilal2453/luvit-meta', lazy = true },

	-- Main LSP Configuration (see `:help lspconfig`)
	{
		'neovim/nvim-lspconfig',
		dependencies = {
			-- Mason: Automatically install LSPs and related tools
			{ 'williamboman/mason.nvim', config = true },
			'williamboman/mason-lspconfig.nvim',
			'WhoIsSethDaniel/mason-tool-installer.nvim',

			-- Fidget: LSP status updates
			{ 'j-hui/fidget.nvim', opts = {} },

			-- cmp-nvim-lsp: LSP completion capabilities for nvim-cmp
			'hrsh7th/cmp-nvim-lsp',
		},
		config = function()
			-- Autocmd: Run when an LSP attaches to a buffer
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('user-lsp-attach', { clear = true }),
				callback = function(event)
					-- Helper function for LSP keymaps
					local map = function(keys, func, desc, mode)
						mode = mode or 'n'
						vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
					end

					-- Keymaps
					map('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
					map('gr', vim.lsp.buf.references, '[G]oto [R]eferences')
					map('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
					map('<leader>ct', vim.lsp.buf.type_definition, '[t]ype definition')
					map('<leader>cr', vim.lsp.buf.rename, '[r]ename variable')
					map('<leader>ca', vim.lsp.buf.code_action, 'code [a]ction', { 'n', 'x' })
					map('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')

					-- Document highlighting on cursor hold
					local client = vim.lsp.get_client_by_id(event.data.client_id)
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
						local highlight_augroup = vim.api.nvim_create_augroup('user-lsp-highlight', { clear = false })
						vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = function()
								vim.lsp.buf.document_highlight()
							end,
						})

						vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
							buffer = event.buf,
							group = highlight_augroup,
							callback = function()
								vim.lsp.buf.clear_references()
							end,
						})

						vim.api.nvim_create_autocmd('LspDetach', {
							group = vim.api.nvim_create_augroup('user-lsp-detach', { clear = true }),
							callback = function(event2)
								vim.lsp.buf.clear_references()
								vim.api.nvim_clear_autocmds { group = 'user-lsp-highlight', buffer = event2.buf }
							end,
						})
					end

					-- Toggle inlay hints
					if client and client.supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
						map('<leader>ci', function()
							vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
						end, 'toggle [i]nlay hints')
					end
				end,
			})

			-- LSP capabilities for nvim-cmp
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

			-- Enabled Language Servers and their configurations
			local servers = {
				lua_ls = {
					offset_encoding = 'utf-8',
					settings = {
						Lua = {
							completion = {
								callSnippet = 'Replace',
							},
							diagnostics = {
								globals = { 'vim' },
							},
						},
					},
				},
				pyright = {
					settings = {
						python = {
							analysis = {
								typeCheckingMode = 'strict',
								autoImportCompletions = true,
							},
						},
					},
				},
				intelephense = {
					filetypes = { 'php' },
					root_dir = require('lspconfig.util').root_pattern('composer.json', '.git'),
				},
				html = {},
				cssls = {},
				ts_ls = {},
				bashls = {},
				dockerls = {},
				emmet_ls = {},
				tailwindcss = {},
				docker_compose_language_service = {},
				gopls = {},
			}

			-- Mason setup
			require('mason').setup()

			-- Ensure tools are installed
			local ensure_installed = vim.tbl_keys(servers or {})

			vim.list_extend(ensure_installed, {
				'stylua', -- Used to format Lua code
				'ruff', -- Linter and formatter for Python
				'pint', -- Formatter for PHP
				'prettier', -- Formatter for web languages
				'gofumpt', -- Stricter formatter for Go
				'goimports-reviser', -- Import organizer for Go
			})

			require('mason-tool-installer').setup { ensure_installed = ensure_installed }

			-- Mason-lspconfig handlers
			require('mason-lspconfig').setup {
				handlers = {
					function(server_name)
						local server = servers[server_name] or {}
						server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
						-- Prefer server-specific encoding, fallback to utf-8
						if server.offset_encoding == nil then
							server.offset_encoding = 'utf-8'
						end
						require('lspconfig')[server_name].setup(server)
					end,
				},
			}
		end,
	},
}
