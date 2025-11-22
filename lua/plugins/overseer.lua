return {
  "stevearc/overseer.nvim",
  opts = {
    templates = { "builtin", "user/cmake_build_run" },

    strategy = {
      "toggleterm",
      close_on_exit = true,
      auto_scroll = true,
      quit_on_exit = "success",
      hidden = false,
      -- direction = "tab",
      direction = "vertical",
    },

    task_list = {
      default_detail = 2,
    },

    component_aliases = {
      default = {
        { "display_duration" },
        -- { "on_output_summarize" },
        {
          "on_output_parse",
          problem_matcher = "$gcc",
        },
        {
          "on_output_quickfix",
          open_on_exit = "failure",
          set_diagnostics = true,
          items_only = true,
        },
        "on_exit_set_status",
        "on_complete_notify",
        "on_complete_dispose",
      },
    },
  },

  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    -- Restart last finished task
    vim.api.nvim_create_user_command("OverseerRestartLast", function()
      local task_list = require("overseer.task_list")
      local tasks = overseer.list_tasks({
        status = {
          overseer.STATUS.SUCCESS,
          overseer.STATUS.FAILURE,
          overseer.STATUS.CANCELED,
        },
        sort = task_list.sort_finished_recently,
      })

      if vim.tbl_isempty(tasks) then
        vim.notify("No tasks found", vim.log.levels.WARN)
      else
        overseer.run_action(tasks[1], "restart")
      end
    end, {})
  end,

  keys = {
    { "<leader>ot", "<cmd>OverseerToggle!<CR>", desc = "Toggle Overseer" },
    { "<leader>or", "<cmd>OverseerRun<CR>", desc = "Run Task" },
    {
      "<leader>oo",
      "<cmd>OverseerRestartLast<CR>",
      desc = "Restart last Overseer task",
    },
  },
}
