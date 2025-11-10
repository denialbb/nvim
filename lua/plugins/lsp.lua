return {
  require("lspconfig").rust_analyzer.setup({
    settings = {
      ["rust-analyzer"] = {
        diagnostics = {
          disabled = { "dead_code" },
        },
      },
    },
  }),
}
