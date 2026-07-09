local jdtls = require "jdtls"

local root_markers = { "mvnw", "gradlew", "pom.xml", "build.gradle", "build.gradle.kts", ".git" }
local root_dir = require("jdtls.setup").find_root(root_markers)

if not root_dir then
  return
end

local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath "data" .. "/jdtls-workspace/" .. project_name
local config_dir = vim.fn.stdpath "data" .. "/jdtls-config"
local mason_bin = vim.fn.stdpath "data" .. "/mason/bin/jdtls"
local jdtls_cmd = vim.fn.exepath "jdtls"

if jdtls_cmd == "" and vim.fn.executable(mason_bin) == 1 then
  jdtls_cmd = mason_bin
end

if jdtls_cmd == "" then
  vim.notify("jdtls is not installed. Run :MasonInstallAll or :MasonInstall jdtls", vim.log.levels.ERROR)
  return
end

local bundles = {}
local java_debug_path = vim.fn.glob(
  vim.fn.stdpath "data" .. "/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar"
)

if java_debug_path ~= "" then
  table.insert(bundles, java_debug_path)
end

vim.list_extend(
  bundles,
  vim.split(
    vim.fn.glob(vim.fn.stdpath "data" .. "/mason/packages/java-test/extension/server/*.jar", true),
    "\n",
    { trimempty = true }
  )
)

local config = {
  cmd = {
    jdtls_cmd,
    "-configuration",
    config_dir,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  init_options = {
    bundles = bundles,
  },
  settings = {
    java = {
      configuration = {
        updateBuildConfiguration = "interactive",
      },
      inlayHints = {
        parameterNames = {
          enabled = "all",
        },
      },
    },
  },
  on_attach = function(_, bufnr)
    jdtls.setup_dap { hotcodereplace = "auto" }
  end,
}

jdtls.start_or_attach(config)
