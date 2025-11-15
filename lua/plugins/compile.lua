return {
  {
    "Zeioth/compiler.nvim",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    dependencies = { "stevearc/overseer.nvim", "nvim-telescope/telescope.nvim" },
    opts = {},
    keys = {
      {
        "<C-b>b",
        "<cmd>CompilerRedo<CR>",
        desc = "Rerun Compiler",
      },
      {
        "<C-b>o",
        "<cmd>CompilerOpen<CR>",
        desc = "Open Compiler",
      },
      {
        "<leader>qo",
        "<cmd>CompilerToggleResults<CR>",
        desc = "Toggle Compiler Results",
      },
    },
  },
  { -- The task runner we use
    "stevearc/overseer.nvim",
    commit = "6271cab7ccc4ca840faa93f54440ffae3a3918bd",
    cmd = { "CompilerOpen", "CompilerToggleResults", "CompilerRedo" },
    opts = {
      task_list = {
        direction = "bottom",
        min_height = 20,
        max_height = 25,
        default_detail = 1,
      },
    },
  },
}
