return {
  {
    "stevearc/conform.nvim",
    config = function()
      require "configs.conform"
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require "configs.linting"
    end,
    event = { "BufReadPre", "BufNewFile" },
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = {
      git = { enable = true, ignore = false },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
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
        "prisma",
        "yaml",
        "graphql",
        "json",
        "toml",
      },
    },
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
