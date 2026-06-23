return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPost", "BufNewFile", "BufWritePre" },
  opts = {
    mode = "cursor",
    max_lines = 3,
  },
}
