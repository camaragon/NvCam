local function project_executable(name)
  local path = vim.fn.findfile(name, vim.fn.getcwd() .. ";")
  return path ~= "" and vim.fn.fnamemodify(path, ":p") or name
end

-- Optionally, define a function to choose a formatter based on the presence of a biome.json file.
local function get_formatter()
  -- If a biome.json file is found in the current working directory, use the "biome" formatter.
  if vim.fn.findfile("biome.json", vim.fn.getcwd() .. ";") ~= "" then
    return { "biome" }
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
    css = get_formatter,
    html = get_formatter,
    javascript = get_formatter,
    javascriptreact = get_formatter,
    json = get_formatter,
    jsonc = get_formatter,
    lua = { "stylua" },
    sql = { "sleek" },
    tex = { "latexindent" },
    typescript = get_formatter,
    typescriptreact = get_formatter,
    vue = get_formatter,
    graphql = get_formatter,
    python = { "ruff_organize_imports", "ruff_format" },
    yaml = { "prettierd", "prettier", stop_after_first = true },
    xml = { "xmlformat" },
    markdown = get_formatter,
    ["*"] = { "injected" },
  },

  -- Additional options for specific formatters.
  formatters = {
    ruff_format = { command = function() return project_executable(".venv/bin/ruff") end },
    ruff_organize_imports = { command = function() return project_executable(".venv/bin/ruff") end },
    latexindent = { prepend_args = { "-l", "-m", "--logfile=/dev/null" } },
    biome = {
      require_cwd = true,
    },
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

return options
