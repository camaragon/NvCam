require "nvchad.options"

local opt = vim.opt

opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true
opt.clipboard = "unnamedplus"
opt.relativenumber = false
opt.cursorlineopt = "both"
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.list = true
opt.listchars = { tab = "→ ", trail = "·", nbsp = "␣" }

-- Folding handled by UFO (provider: lsp + indent)
opt.foldlevel = 99
opt.foldlevelstart = 99
