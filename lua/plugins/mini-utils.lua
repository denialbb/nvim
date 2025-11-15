return {
  {
    "nvim-mini/mini.pick",
    event = "VeryLazy",
    version = false,
    config = function()
      local pick = require("mini.pick")
      pick.setup({
        source = {
          show = pick.default_show,
        },
      })
    end,
  },
  { "nvim-mini/mini.bufremove", version = false, opts = {} },
}
