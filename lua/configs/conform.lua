local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    css = { "prettier" },
    graphql = { "prettier" },
    html = { "prettier" },
    javascript = { "prettier" },
    javascriptreact = { "prettier" },
    json = { "prettier" },
    lua = { "stylua" },
    markdown = { "prettier" },
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    yaml = { "prettier" },
  },
  format_on_save = {
    lsp_fallback = true,
    async = false,
  },
}

require("conform").setup(options)
