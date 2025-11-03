require "nvchad.options"

local opt = vim.opt

opt.colorcolumn = "80"
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = false
opt.autoindent = true
opt.smartindent = true
opt.relativenumber = false
opt.list = true
opt.cursorlineopt = "both" -- to enable cursorline!
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevel = 99
opt.foldlevelstart = 99
