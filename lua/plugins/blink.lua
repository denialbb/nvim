return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      trigger = {
        prefetch_on_insert = false,
        show_on_insert = true,
      },
    },
    keymap = {
      preset = "super-tab",
      ["<C-Space>"] = { "show", "fallback" }, -- manual trigger
    },
  },
}
