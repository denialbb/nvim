return {
  {
    "3rd/image.nvim",
    opts = {
      backend = "kitty", -- Adjust to "wezterm" or others if you do not use kitty
      integrations = {
        markdown = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = false,
        },
      },
    },
  },
  {
    "3rd/diagram.nvim",
    dependencies = {
      "3rd/image.nvim",
    },
    opts = {
      renderer_options = {
        mermaid = {
          theme = "dark",
        }
      }
    },
  },
}
