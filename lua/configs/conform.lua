-- Optionally, define a function to choose a formatter based on the presence of a biome.json file.
local function get_formatter()
  -- If a biome.json file is found in the current working directory, use the "biome-check" chain.
  if vim.fn.findfile("biome.json", vim.fn.getcwd() .. ";") ~= "" then
    return { "biome-check", "prettierd", "prettier", stop_after_first = true }
  else
    return { "prettierd", "prettier", stop_after_first = true }
  end
end

local options = {
  notify_on_error = true,
  notify_no_formatters = false,
  lsp_fallback = true, -- fallback to LSP formatting when no formatter is available

  -- Define formatters by filetype.
  formatters_by_ft = {
    css = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    html = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    javascript = get_formatter, -- use the dynamic formatter
    javascriptreact = get_formatter, -- use the dynamic formatter
    json = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    jsonc = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    lua = { "stylua" },
    sql = { "sleek" },
    tex = { "latexindent" },
    typescript = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    typescriptreact = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    vue = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    graphql = { "biome-check", "prettierd", "prettier", stop_after_first = true },
    python = { "ruff_format", "ruff_organize_imports" },
    yaml = { "prettierd", "prettier", stop_after_first = true },
    xml = { "xmlformat" },
    markdown = get_formatter, -- can also use the dynamic formatter for markdown
    ["*"] = { "injected" },
  },

  -- Additional options for specific formatters.
  formatters = {
    latexindent = { prepend_args = { "-l", "-m", "--logfile=/dev/null" } },
    biome = { require_cwd = true },
    ["biome-check"] = { require_cwd = true },
    sleek = { prepend_args = { "--indent-spaces", "2" } },
    xmlformat = { prepend_args = { "--selfclose" } },
  },

  -- Configure formatting on save.
  format_on_save = {
    lsp_format = "fallback", -- use LSP if no formatter is defined
    timeout = 500, -- timeout in milliseconds
    async = false, -- synchronous formatting (set to true if you prefer async)
  },
}

-- Setup Conform with the defined options.
require("conform").setup(options)

-- Optionally, set formatexpr for Vim to use Conform when invoking formatting commands.
vim.opt.formatexpr = [[v:lua.require("conform").formatexpr()]]
