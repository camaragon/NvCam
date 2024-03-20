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
