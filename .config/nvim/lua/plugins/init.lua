return {

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  {
  	"nvim-treesitter/nvim-treesitter",
    lazy = true,
  	opts = {
      highlight = {
       enable = true,
      },
  		ensure_installed = {
        "json",
        "javascript",
        "javascriptreact",
        "python",
        "php",
        "typescript",
        "typescriptreact",
        "tsx",
        "yaml",
        "html",
        "css",
        "prisma",
        "markdown",
        "markdown_inline",
        "bash",
        "lua",
        "vim",
        "dockerfile",
        "gitignore",
        "query",
        "vimdoc",
  		},
  	},
  },

  -- lazygit
  {
    "kdheepak/lazygit.nvim",
    enabled = true,
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
  },

  -- vim blade
  {
    "jwalton512/vim-blade",
    enabled = true,
    lazy = true,
  },

}
