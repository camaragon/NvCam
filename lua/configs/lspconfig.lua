-- Using vim.lsp.config API (nvim 0.11+) instead of deprecated require("lspconfig")
local nvchad_configs = require "nvchad.configs.lspconfig"

local capabilities = nvchad_configs.capabilities

-- Add folding capability
capabilities.textDocument.foldingRange = {
  dynamicRegistration = false,
  lineFoldingOnly = true,
}

-- Base config for all servers
vim.lsp.config("*", {
  capabilities = capabilities,
  on_init = nvchad_configs.on_init,
})

-- Lua gets custom settings
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
    },
  },
})

-- Enable all servers
-- Java is intentionally managed by nvim-jdtls so its DAP bundles and project
-- workspace can be configured per project.
local servers = {
  "bashls",
  "biome",
  "cssls",
  "graphql",
  "html",
  "jsonls",
  "lua_ls",
  "prismals",
  "pyright",
  "rust_analyzer",
  "tailwindcss",
  "ts_ls",
  "vimls",
  "yamlls",
}

vim.lsp.enable(servers)
