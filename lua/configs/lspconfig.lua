local configs = require("nvchad.configs.lspconfig")

local on_attach = configs.on_attach
local on_init = configs.on_init
local capabilities = configs.capabilities

local lspconfig = require("lspconfig")
local servers = { "html", "cssls", "jsonls", "tsserver", "vimls", "yamlls", "lua_ls" }

for _, lsp in ipairs(servers) do
	if lsp == "lua_ls" then
		require("nvim-treesitter.configs").setup({
			on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	else
		lspconfig[lsp].setup({
			on_init = on_init,
			on_attach = on_attach,
			capabilities = capabilities,
		})
	end
end