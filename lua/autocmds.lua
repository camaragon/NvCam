local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- LSP
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    -- Disable semantic tokens to avoid conflicts
    client.server_capabilities.semanticTokensProvider = nil

    -- Enable format-on-save only for Rust
    if client.name == "rust_analyzer" then
      autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format { async = false }
        end,
      })
    end
  end,
})

-- Linting
autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
  group = augroup("lint", { clear = true }),
  callback = function()
    require("lint").try_lint()
  end,
})

-- Git
autocmd("User", {
  pattern = "GitConflictDetected",
  callback = function()
    vim.notify("Conflict detected in " .. vim.fn.expand "<afile>")
    -- Additional logic for when a conflict is detected
  end,
})

autocmd("User", {
  pattern = "GitConflictResolved",
  callback = function()
    vim.notify("Conflict resolved in " .. vim.fn.expand "<afile>")
    -- Additional logic for when a conflict is resolved
  end,
})
