return {
  "nvim-lualine/lualine.nvim",
  opts = {
    options = {
      theme = "seoul256",
      globalstatus = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = { "snacks_dashboard", "dashboard", "alpha" },
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return str:sub(1, 1)
          end,
        },
      },
      lualine_b = {},
      lualine_c = {
        { "filename", path = 1, shorting_target = 40 },
      },
      lualine_x = {
        "diagnostics",
        {
          function()
            local reg = vim.fn.reg_recording()
            if reg == "" then
              return ""
            end
            return "REC @" .. reg
          end,
          color = { bg = "#ff4444", fg = "#222222", gui = "bold" }, -- Red bold text
          padding = { left = 1, right = 1 },
        },
        "filetype",
      },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_c = { { "filename", path = 1 } },
      lualine_x = { "location" },
    },
  },
}
