-- This file needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :( 

---@type ChadrcConfig
local M = {}

M.base46 = {
	theme = "ayu_dark",

	hl_override = {
		Comment = { italic = true },
		["@comment"] = { italic = true },
	},
}

M.mason = {
	pkgs = {
		"bash-language-server",
		"biome",
		"css-lsp",
		"debugpy",
		"eslint_d",
		"html-lsp",
		"json-lsp",
		"lua-language-server",
		"luaformatter",
		"prettier",
		"prettierd",
		"prisma-language-server",
		"pyright",
		"ruff",
		"rust-analyzer",
		"stylua",
		"tailwindcss-language-server",
		"typescript-language-server",
		"vim-language-server",
		"yaml-language-server",
		"jdtls",
		"java-debug-adapter",
		"java-test",
	},
}

M.cheatsheet = {
	theme = "simple",
}

-- M.nvdash = { load_on_startup = true }
-- M.ui = {
--       tabufline = {
--          lazyload = false
--      }
-- }

return M
