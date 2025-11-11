return {
  "stevearc/overseer.nvim",
  require("overseer").setup({
    strategy = {
      "toggleterm",
      use_shell = false,
      direction = "float",
      highlights = nil,
      auto_scroll = nil,
      close_on_exit = true,
      quit_on_exit = "success",
      open_on_start = true,
      hidden = false,
      -- command to run when the terminal is created. Combine with `use_shell`
      -- to run a terminal command before starting the task
      on_create = nil,
    },
  }),
}
