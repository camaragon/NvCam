require "nvchad.mappings"

local map = vim.keymap.set
local hop = require "hop"
local directions = require("hop.hint").HintDirection

-- Remove unwanted NvChad default mappings
pcall(vim.keymap.del, "n", "<leader>lf")

-- ── General ──────────────────────────────────────────────────────────
map("n", ";", ":", { desc = "General Enter command mode" })
map("i", "jk", "<ESC>", { desc = "General Exit insert mode" })
map("n", "<leader>s", "<cmd>w!<cr>", { desc = "General Save file" })
map("n", "<leader>q", "<cmd>q!<cr>", { desc = "General Force quit" })
map("n", "<leader>rp", ":let @+=expand('%:~:.')<CR>", { desc = "General Copy relative path" })

-- ── Navigation ───────────────────────────────────────────────────────
map("n", "-", "<cmd>Oil<CR>", { desc = "Nav Open parent directory (Oil)" })
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Nav Window left" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Nav Window right" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Nav Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Nav Window up" })

-- ── Hop (fast cursor movement) ───────────────────────────────────────
map("", "<leader>w", function() hop.hint_words() end, { noremap = true, desc = "Hop Jump to word" })
map("", "<leader>g", function() hop.hint_vertical() end, { noremap = true, desc = "Hop Jump vertical" })
map("", "f", function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true } end, { remap = true, desc = "Hop Char forward" })
map("", "F", function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true } end, { remap = true, desc = "Hop Char backward" })
map("", "t", function() hop.hint_char1 { direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 } end, { remap = true, desc = "Hop Till char forward" })
map("", "T", function() hop.hint_char1 { direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 } end, { remap = true, desc = "Hop Till char backward" })

-- ── LSP ──────────────────────────────────────────────────────────────
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP Code action" })
map("n", "<leader>f", "<cmd>lua vim.diagnostic.open_float({border = 'rounded' })<CR>", { desc = "LSP Open diagnostic float" })
map("n", "K", vim.lsp.buf.hover, { desc = "LSP Hover docs" })
map("n", "<leader>fm", function() require("conform").format() end, { desc = "LSP Format file (conform)" })
map("n", "<leader>l", "<cmd>lua require('lint').try_lint()<CR>", { desc = "LSP Trigger linting" })

-- ── Folding (UFO) ───────────────────────────────────────────────────
map("n", "zR", require("ufo").openAllFolds, { desc = "Fold Open all" })
map("n", "zM", require("ufo").closeAllFolds, { desc = "Fold Close all" })
map("n", "zK", function()
  local winid = require("ufo").peekFoldedLinesUnderCursor()
  if not winid then vim.lsp.buf.hover() end
end, { desc = "Fold Peek" })

-- ── Git ──────────────────────────────────────────────────────────────
map("n", "<leader>gs", ":Git<CR>", { desc = "Git Status" })
map("n", "<leader>gl", ":Git blame<CR>", { desc = "Git Blame (all lines)" })
map("n", "<leader>gg", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Git Toggle inline blame" })
map("n", "<leader>di", ":vert Git diff<CR>", { desc = "Git Vertical diff" })

-- ── Debug (DAP) ──────────────────────────────────────────────────────
map("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debug Toggle breakpoint" })
map("n", "<leader>dus", function()
  local widgets = require "dap.ui.widgets"
  local sidebar = widgets.sidebar(widgets.scopes)
  sidebar.open()
end, { desc = "Debug Open sidebar" })

-- ── Terminal ─────────────────────────────────────────────────────────
map("n", "<leader>h", "<cmd>silent !tmux split-window -v<CR>", { desc = "Term Horizontal tmux split" })
map("n", "<leader>v", "<cmd>silent !tmux split-window -h<CR>", { desc = "Term Vertical tmux split" })
map("n", "<leader>ft", "<cmd>lua require('nvchad.term').toggle({pos = 'float', id = 'floatTerm'})<CR>", { desc = "Term Toggle floating terminal" })

-- ── Rust (Crates) ───────────────────────────────────────────────────
map("n", "<leader>rcu", function() require("crates").upgrade_all_crates() end, { desc = "Rust Upgrade all crates" })

-- ── Todo Comments ───────────────────────────────────────────────────
map("n", "<leader>td", "<cmd>TodoTelescope<CR>", { desc = "Todo Search all TODOs" })
map("n", "<leader>tl", "<cmd>Trouble todo toggle<CR>", { desc = "Todo List in Trouble" })
map("n", "]t", function() require("todo-comments").jump_next() end, { desc = "Todo Jump to next" })
map("n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Todo Jump to previous" })

-- ── Spectre (find & replace) ────────────────────────────────────────
map("n", "<leader>sr", "<cmd>lua require('spectre').open()<CR>", { desc = "Spectre Open search & replace" })
map("n", "<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true})<CR>", { desc = "Spectre Search current word" })
map("v", "<leader>sw", "<esc><cmd>lua require('spectre').open_visual()<CR>", { desc = "Spectre Search selection" })

-- ── Trouble (diagnostics) ───────────────────────────────────────────
map("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<CR>", { desc = "Trouble Workspace diagnostics" })
map("n", "<leader>xd", "<cmd>Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble Buffer diagnostics" })
map("n", "<leader>xl", "<cmd>Trouble loclist toggle<CR>", { desc = "Trouble Location list" })
map("n", "<leader>xq", "<cmd>Trouble quickfix toggle<CR>", { desc = "Trouble Quickfix list" })

-- ── Avante (AI) ─────────────────────────────────────────────────────
-- Avante keybindings are defined in plugin opts (plugins/init.lua)
-- <leader>aa = Ask AI | <leader>ae = AI Edit | <leader>at = Toggle panel
