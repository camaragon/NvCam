require("nvchad.mappings")

local map = vim.keymap.set
local emptyMap = "nil"

map("n", ";", ":", { desc = "CMD enter command mode" })

map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "File Format with conform" })

map("i", "jk", "<ESC>", { desc = "Escape insert mode" })

-- DAP mappings
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle DAP Breakpoint" })
map("n", "<leader>dus", function()
	local widgets = require("dap.ui.widgets")
	local sidebar = widgets.sidebar(widgets.scopes)
	sidebar.open()
end, { desc = "Open debugging sidebar" })

-- Crates mappings
map("n", "<leader>rcu", function()
	require("crates").upgrade_all_crates()
end, { desc = "Update Crates" })

-- Custom mappings
map("n", "<leader>q", "<cmd>q!<cr>", { desc = "Force Quit" })
-- map("n", "<leader>e", "<cmd>NvimTreeToggle<cr>", { desc = "Toggle NvimTree" }) -- Commented out as per original mapping
map("n", "<leader>s", "<cmd>w!<cr>", { desc = "Save File" })
map("n", "<leader>rp", ":let @+=expand('%:~:.')<CR>", { desc = "Copy Relative Path" })

-- General mappings
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Window up" })

-- Git mappings
map("n", "<leader>gl", ":Git blame<CR>", { desc = "All git blame lines" })
map("n", "<leader>gg", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle git blame" })
map("n", "<leader>di", ":vert Git diff<CR>", { desc = "Git diff" })
map("n", "<leader>gs", ":Git<CR>", { desc = "Git status" })

-- Lspconfig mappings
map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float({border = 'rounded' })<CR>", { desc = "Open LSP float" })
map("n", "<leader>lf", emptyMap)

-- Nvterm mappings
map("n", "<leader>h", "<cmd>silent !tmux split-window -v<CR>", { desc = "New Horizontal Term" })
map("n", "<leader>v", "<cmd>silent !tmux split-window -h<CR>", { desc = "New Vertical Term" })

-- Linting mappings
map("n", "<leader>l", "<cmd>lua require('lint').try_lint()<CR>", { desc = "Trigger linting for current file" })