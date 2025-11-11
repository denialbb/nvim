-- Non-coding filetypes to SKIP
local non_coding = {
  "txt",
  "help",
  "man",
  "TelescopePrompt",
  "lazy",
  "mason",
  "lspinfo",
  "alpha",
  "dashboard",
  "neo-tree",
  "trouble",
  "qf",
  "gitcommit",
  "gitrebase",
  "gitconfig",
}

return {
  "xiyaowong/virtcolumn.nvim",
  event = { "BufReadPost", "BufNewFile" },
  -- cond = function()
  --   local ft = vim.bo.filetype
  --   return ft ~= "" and not vim.tbl_contains(non_coding, ft)
  -- end,
  setup = function()
    require("virtcolumn").setup()
    char = "│"
  end,
}
