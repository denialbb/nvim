-- ~/.config/nvim/lua/plugins/neocodeium.lua
return {
  "monkoose/neocodeium",
  event = "VeryLazy",
  keys = {
    { "<C-a>", mode = "i" }, -- Auto-load on accept key
  },
  config = function()
    local nc = require("neocodeium")

    nc.setup({
      silent = true, -- Less spam in :messages
      manual = false, -- Auto-show suggestions
      filetypes = {
        ["*"] = true,
        markdown = false,
        txt = false,
        help = false,
      },
    })

    vim.keymap.set("i", "<C-a>", nc.accept, { desc = "NeoCodeium: Accept" })
    vim.keymap.set(
      "i",
      "<A-w>",
      nc.accept_word,
      { desc = "NeoCodeium: Accept word" }
    )
    vim.keymap.set(
      "i",
      "<A-a>",
      nc.accept_line,
      { desc = "NeoCodeium: Accept line" }
    )
  end,
}
