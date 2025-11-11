return {

  -- Mason (install LSPs)
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = { "rust-analyzer" },
    },
  },

  -- LSP config
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        rust_analyzer = {
          settings = {
            ["rust-analyzer"] = {
              cargo = { allFeatures = true },
              checkOnSave = { command = "clippy" },
              procMacro = { enable = true },
            },
          },
        },
      },
    },
  },
}
