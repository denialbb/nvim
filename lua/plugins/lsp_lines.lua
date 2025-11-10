return {
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
    event = "LspAttach",
    config = function()
      require("lsp_lines").setup()
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextWarn", { link = "LineNr" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextInfo", { link = "LineNr" })
      vim.api.nvim_set_hl(0, "DiagnosticVirtualTextHint", { link = "LineNr" })
      vim.diagnostic.config({
        signs = false,
        highlight_whole_line = false,
        underline = false,
        virtual_text = false,
        virtual_lines = true, -- this enables lsp_lines
      })
    end,
  },
}
