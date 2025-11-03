return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "prettier",
        "stylua",
        "typescript-language-server",
        "luaformatter",
        "pyright",
        "ruff",
        "debugpy",
      },
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
        "zig",
        "python",
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
    "smoka7/hop.nvim",
    version = "*",
    config = function()
      require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
    end,
  },

  { "kevinhwang91/nvim-ufo", dependencies = "kevinhwang91/promise-async" },

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
