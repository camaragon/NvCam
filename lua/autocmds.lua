local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- LSP
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)

    client.server_capabilities.semanticTokensProvider = nil
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
