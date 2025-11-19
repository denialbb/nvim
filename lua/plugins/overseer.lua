return {
  "stevearc/overseer.nvim",
  opts = {
    task_list = {
      default_detail = 2,
    },
    component_aliases = {
      default = {
        { "display_duration" },
        { "on_output_summarize" },
        { "on_output_parse" }, -- Parses output using 'efm'
        {
          "on_output_quickfix",
          open_on_exit = "failure",
          set_diagnostics = true,
          items_only = true,
        }, -- Adds to qflist; set open=true to auto-open
        "on_exit_set_status",
        "on_complete_notify",
        "on_complete_dispose",
      },
    },
  },
  keys = {
    { "<leader>ot", "<cmd>OverseerToggle!<CR>", desc = "Toggle Overseer" },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Task" },
  },
  require("overseer").setup({
    strategy = {
      close_on_exit = true,
      quit_on_exit = "success",
      open_on_start = true,
      hidden = false,
      -- command to run when the terminal is created. Combine with `use_shell`
      -- to run a terminal command before starting the task
      -- on_create = nil,
    },
  }),
}
