-- Completion (nvim-cmp) (see `:help cmp`)
-- See: https://github.com/hrsh7th/nvim-cmp

return {
	'hrsh7th/nvim-cmp',
	event = 'InsertEnter',
	dependencies = {
		'folke/noice.nvim',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/cmp-buffer',
		'hrsh7th/cmp-path',
		'hrsh7th/cmp-cmdline',
		'saadparwaiz1/cmp_luasnip',
		'hrsh7th/cmp-nvim-lua',
		'hrsh7th/cmp-calc',
		'hrsh7th/cmp-emoji',
		'hrsh7th/cmp-nvim-lsp-signature-help',
		'nvim-tree/nvim-web-devicons',

		-- Snippet engine
		{
			'L3MON4D3/LuaSnip',
			build = (function()
				if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
					return
				end
				return 'make install_jsregexp'
			end)(),
			dependencies = {
				{
					'rafamadriz/friendly-snippets',
					config = function()
						require('luasnip.loaders.from_vscode').lazy_load()
					end,
				},
			},
		},
	},
	config = function()
		local cmp = require 'cmp'
		local luasnip = require 'luasnip'
		local kind_icons = require('nvim-web-devicons').get_icons()

		luasnip.setup {}

		cmp.setup {
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
			mapping = cmp.mapping.preset.insert {
				['<C-b>'] = cmp.mapping.scroll_docs(-4),
				['<C-f>'] = cmp.mapping.scroll_docs(4),
				['<C-Space>'] = cmp.mapping.complete(),
				['<C-e>'] = cmp.mapping.abort(),
				['<CR>'] = cmp.mapping.confirm { select = true },

				['<C-l>'] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { 'i', 's' }),
				['<C-h>'] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { 'i', 's' }),
			},
			sources = cmp.config.sources({
				{ name = 'nvim_lsp' },
				{ name = 'luasnip' },
				{ name = 'buffer' },
				{ name = 'path' },
				{ name = 'calc' },
				{ name = 'emoji' },
				{ name = 'nvim_lsp_signature_help' },
			}, {
				{ name = 'cmdline' },
			}),
			formatting = {
				format = function(entry, vim_item)
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind)
					vim_item.menu = ({
						buffer = '[Buffer]',
						nvim_lsp = '[LSP]',
						luasnip = '[LuaSnip]',
						path = '[Path]',
						cmdline = '[Cmd]',
						calc = '[Calc]',
						emoji = '[Emoji]',
						nvim_lua = '[Lua]',
						nvim_lsp_signature_help = '[Signature]',
					})[entry.source.name]
					return vim_item
				end,
			},
		}

		-- Filetype specific configs
		cmp.setup.filetype('gitcommit', {
			sources = cmp.config.sources({
				{ name = 'cmp_git' },
			}, {
				{ name = 'buffer' },
			}),
		})

		cmp.setup.cmdline({ '/', '?' }, {
			mapping = cmp.mapping.preset.cmdline(),
			sources = {
				{ name = 'buffer' },
			},
		})

		cmp.setup.cmdline(':', {
			mapping = cmp.mapping.preset.cmdline(),
			sources = cmp.config.sources({
				{ name = 'path' },
				{ name = 'cmdline' },
			}),
		})
	end,
}
