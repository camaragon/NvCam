local lint = require("lint")

-- Function to determine which linter to use based on project config
local function has_eslint_config()
  local eslint_configs = {
    ".eslintrc",
    ".eslintrc.js",
    ".eslintrc.json",
    ".eslintrc.yml",
    ".eslintrc.yaml",
    "eslint.config.js",
    "eslint.config.mjs",
  }

  for _, config in ipairs(eslint_configs) do
    if vim.fn.findfile(config, vim.fn.getcwd() .. ";") ~= "" then
      return true
    end
  end

  -- Check for eslintConfig in package.json
  local package_json = vim.fn.findfile("package.json", vim.fn.getcwd() .. ";")
  if package_json ~= "" then
    local ok, content = pcall(vim.fn.readfile, package_json)
    if ok then
      local json_str = table.concat(content, "\n")
      if json_str:match('"eslintConfig"') then
        return true
      end
    end
  end

  return false
end

-- Only use eslint_d if ESLint config exists, otherwise rely on Biome LSP
lint.linters_by_ft = {
  python = { "ruff" },
}

-- Conditionally add eslint_d for JS/TS files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost" }, {
  callback = function()
    local ft = vim.bo.filetype
    if ft == "javascript" or ft == "javascriptreact" or ft == "typescript" or ft == "typescriptreact" then
      if has_eslint_config() then
        lint.linters_by_ft[ft] = { "eslint_d" }
      else
        lint.linters_by_ft[ft] = {}
      end
    end
  end,
})
