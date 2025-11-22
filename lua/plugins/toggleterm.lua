return {
  "akinsho/toggleterm.nvim",
  opts = {
    -- persist_size = true,
    size = 60,
    direction = "float",
    float_opts = {
      -- (e.g., "curved", "single", "double", "none")
      border = "curved",
      win_config = function(config)
        local screen_w = vim.opt.columns:get()
        local screen_h = vim.opt.lines:get()
        local width = math.floor(screen_w * 0.7)
        local height = math.floor(screen_h * 0.55)

        local col = math.floor((screen_w - width) / 2)
        local row = math.floor((screen_h - height) / 2)

        return vim.tbl_extend("force", config, {
          width = width,
          height = height,
          col = col,
          row = row,
        })
      end,
    },
    open_mapping = [[<C-\>]],
    hide_numbers = true,
    shade_terminals = true,
    start_in_insert = true,
    insert_mappings = true,
    terminal_mappings = true,
    close_on_exit = true,
  },

  keys = {
    {
      "<leader>tf",
      "<cmd>ToggleTerm direction=float<cr>",
      desc = "Toggle Floating Terminal",
    },
    {
      "<leader>tv",
      "<cmd>ToggleTerm direction=vertical<cr>",
      desc = "Toggle Vertical Terminal",
    },
    {
      "<leader>th",
      "<cmd>ToggleTerm direction=horizontal<cr>",
      desc = "Toggle Horizontal Terminal",
    },
  },
}
