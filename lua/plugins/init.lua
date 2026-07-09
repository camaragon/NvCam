return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    opts = require "configs.conform",
    config = function(_, opts)
      require("conform").setup(opts)
      vim.opt.formatexpr = [[v:lua.require("conform").formatexpr()]]
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
    -- Note: configs/lspconfig.lua now uses vim.lsp.config() API (nvim 0.11+)
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.linting"
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  -- test new blink
  -- { import = "nvchad.blink.lazyspec" },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true, ignore = false },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "vimdoc",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",

        -- low level
        "c",
        "rust",
        "zig",
        "python",
        "java",
        "prisma",
        "yaml",
        "graphql",
        "json",
        "toml",
      },
      highlight = {
        enable = true,
      },
    },
  },
  {
    "nvim-treesitter/playground",
    cmd = { "TSPlaygroundToggle", "TSNodeUnderCursor" }, -- Optional lazy-load
    config = function()
      require("nvim-treesitter.configs").setup {
        playground = {
          enable = true,
          updatetime = 25,
          persist_queries = false,
        },
      }
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "InsertEnter",
    config = true,
  },

  {
    "github/copilot.vim",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  { "tpope/vim-fugitive", event = "BufRead" },

  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "stevearc/oil.nvim",
    event = "VimEnter",
    config = function()
      require("oil").setup()
    end,
  },

  {
    "folke/persistence.nvim",
    event = "BufReadPre",
    opts = {
      options = { "buffers", "curdir", "tabpages", "winsize" },
    },
  },

  {
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    dependencies = "kevinhwang91/promise-async",
    config = function()
      require("ufo").setup {
        provider_selector = function(bufnr, filetype, buftype)
          return { "lsp", "indent" }
        end,
      }
    end,
  },

  {
    "saecki/crates.nvim",
    tag = "stable",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufRead Cargo.toml", "BufNewFile Cargo.toml" },
    config = function()
      require("crates").setup()
    end,
  },
  {
    "luckasRanarison/tailwind-tools.nvim",
    name = "tailwind-tools",
    build = ":UpdateRemotePlugins",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-telescope/telescope.nvim", -- optional
      "neovim/nvim-lspconfig", -- optional
    },
    opts = {},
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    lazy = true,
    event = "VeryLazy",
    config = function()
      require("ts_context_commentstring").setup {
        enable_autocmd = false,
      }
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
    },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- DAP (Debug Adapter Protocol) plugins
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      
      dapui.setup()
      require("nvim-dap-virtual-text").setup()
      
      -- Open/close dapui automatically
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  
  {
    "mfussenegger/nvim-dap-python",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require("dap-python").setup("python")
    end,
  },

  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      require "configs.jdtls"
    end,
  },

  -- todo-comments.nvim — Highlight and search TODO/FIXME/HACK/NOTE in codebase
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPre", "BufNewFile" },
    opts = {},
  },

  -- nvim-spectre — Project-wide find and replace with regex + live preview
  {
    "nvim-pack/nvim-spectre",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = "Spectre",
    opts = {},
  },

  -- overseer.nvim — Project task runner for build/test/dev commands
  {
    "stevearc/overseer.nvim",
    cmd = {
      "OverseerBuild",
      "OverseerClearCache",
      "OverseerClose",
      "OverseerDeleteBundle",
      "OverseerInfo",
      "OverseerLoadBundle",
      "OverseerOpen",
      "OverseerQuickAction",
      "OverseerRun",
      "OverseerRunCmd",
      "OverseerSaveBundle",
      "OverseerTaskAction",
      "OverseerToggle",
    },
    opts = {},
  },

  -- trouble.nvim — Better diagnostics list with workspace-wide errors/warnings
  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
  },

  -- avante.nvim — AI chat inside neovim (Claude/GPT context-aware code editing)
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    version = false,
    build = "make",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      provider = "copilot",
      providers = {
        copilot = {
          model = "claude-sonnet-4.6",
        },
      },
      -- Keybindings defined in mappings.lua for cheatsheet visibility
      mappings = {
        ask = "<leader>aa",
        edit = "<leader>ae",
        refresh = "<leader>ar",
        toggle = {
          default = "<leader>at",
        },
      },
    },
  },

  -- "nvim-lua/plenary.nvim",
  --
  -- {
  --   "nvchad/ui",
  --   config = function()
  --     require "nvchad"
  --   end,
  -- },
  --
  -- {
  --   "nvchad/base46",
  --   lazy = true,
  --   build = function()
  --     require("base46").load_all_highlights()
  --   end,
  -- },
  --
  -- "nvchad/volt", -- optional, needed for theme switcher
  -- -- or just use Telescope themes
}
