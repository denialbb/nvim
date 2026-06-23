return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  keys = {
    { "<leader>rE", function() require("refactoring").refactor("Extract Function") end, mode = "v", desc = "Extract Function" },
    { "<leader>rf", function() require("refactoring").refactor("Extract Function To File") end, mode = "v", desc = "Extract Function To File" },
    { "<leader>rv", function() require("refactoring").refactor("Extract Variable") end, mode = "v", desc = "Extract Variable" },
    { "<leader>rI", function() require("refactoring").refactor("Inline Function") end, mode = "n", desc = "Inline Function" },
    { "<leader>ri", function() require("refactoring").refactor("Inline Variable") end, mode = { "n", "v" }, desc = "Inline Variable" },
    { "<leader>rb", function() require("refactoring").refactor("Extract Block") end, mode = "n", desc = "Extract Block" },
    { "<leader>rbf", function() require("refactoring").refactor("Extract Block To File") end, mode = "n", desc = "Extract Block To File" },
  },
  opts = {},
}
