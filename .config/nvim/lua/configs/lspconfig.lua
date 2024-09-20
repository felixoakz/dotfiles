-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")

local nvlsp = require("nvchad.configs.lspconfig")

-- list of all servers configured.
lspconfig.servers = {
  "lua_ls",
  "html",
  "cssls",
  "pyright",
  "intelephense",
  "ts_ls",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
  "emmet_ls",
  "tailwindcss",
}

-- list of servers configured with default config.
local default_servers = {
  "lua_ls",
  "html",
  "cssls",
  "pyright",
  "intelephense",
  "ts_ls",
  "bashls",
  "docker_compose_language_service",
  "dockerls",
  "emmet_ls",
  "tailwindcss",
}

-- lsps with default config
for _, lsp in ipairs(default_servers) do
  lspconfig[lsp].setup({
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  })
end
