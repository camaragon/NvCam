-- nvchad.autocmds is already loaded in init.lua, no need to require it again

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- LSP
autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end

    -- Disable semantic tokens to avoid conflicts with Treesitter
    if client:supports_method "textDocument/semanticTokens" then
      client.server_capabilities.semanticTokensProvider = nil
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

-- Highlight yanked text briefly
autocmd("TextYankPost", {
  group = augroup("highlight-yank", { clear = true }),
  callback = function()
    vim.hl.on_yank { higroup = "IncSearch", timeout = 200 }
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
