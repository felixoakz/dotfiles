local options = {

  ensure_installed = {
    "bash",
    "luadoc",
    "printf",
    "toml",
    "vimdoc",
    "json",
    "jsonc",
    "nginx",
    "javascript",
    "python",
    "php",
    "typescript",
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

  highlight = {
    enable = true,
    use_languagetree = true,
  },

  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
