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
}
