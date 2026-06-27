return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = false,
      },
      trigger = {
        prefetch_on_insert = false,
        show_on_insert = false,
      },
    },
    keymap = {
      preset = "default",
      ["<C-;>"] = { "show", "hide", "fallback" },
    },
  },
}
