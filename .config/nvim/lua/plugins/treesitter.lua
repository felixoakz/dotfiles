return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = {
        'bash',
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
        'bash',
        'lua',
        'vim',
        'dockerfile',
        'gitignore',
        'query',
        'vimdoc',
      },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = { enable = true },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  -- {
  --   'nvim-treesitter/nvim-treesitter-context',
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   config = function()
  --     require('treesitter-context').setup {
  --       enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
  --       max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
  --       min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
  --       line_numbers = true,
  --       multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
  --       trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
  --       mode = 'cursor', -- Line used to calculate context. Choices: 'cursor', 'topline'
  --       -- Separator between context and content. Should be a single character string, like '-'.
  --       -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
  --       separator = nil,
  --       zindex = 20, -- The Z-index of the context window
  --     }
  --   end,
  -- },
}
