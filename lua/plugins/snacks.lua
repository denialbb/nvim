return {
  "folke/snacks.nvim",
  opts = {
    ---@class snacks.dashboard.Config
    dashboard = {
      width = 35,
      row = nil, -- dashboard position. nil for center
      col = nil, -- dashboard position. nil for center
      pane_gap = 12, -- empty columns between vertical panes
      autokeys = "1234567890abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ", -- autokey sequence
      -- These settings are used by some built-in sections
      preset = {
        -- Defaults to a picker that supports `fzf-lua`, `telescope.nvim` and `mini.pick`
        ---@type fun(cmd:string, opts:table)|nil
        pick = nil,
        -- Used by the `keys` section to show keymaps.
        -- Set your custom keymaps here.
        -- When using a function, the `items` argument are the default keymaps.
        ---@type snacks.dashboard.Item[]
        keys = {
          {
            -- icon = " ",
            key = "f",
            desc = "files",
            action = ":lua Snacks.dashboard.pick('files')",
          },
          {
            -- icon = " ",
            key = "n",
            desc = "new file",
            action = ":ene | startinsert",
          },
          {
            -- icon = " ",
            key = "g",
            desc = "search text",
            action = ":lua Snacks.dashboard.pick('live_grep')",
          },
          {
            -- icon = " ",
            key = "s",
            desc = "restore",
            section = "session",
          },
          {
            -- icon = " ",
            key = "q",
            desc = "quit",
            action = ":qa",
          },
        },
        header = [[N   E   O   V   I   M]],
        --         header = [[
        --               $$ $$$$$ $$
        --               $$ $$$$$ $$
        --              .$$ $$$$$ $$.
        --              :$$ $$$$$ $$:
        --              $$$ $$$$$ $$$
        --              $$$ $$$$$ $$$
        --             ,$$$ $$$$$ $$$.
        --            ,$$$$ $$$$$ $$$$.
        --           ,$$$$; $$$$$ :$$$$.
        --          ,$$$$$  $$$$$  $$$$$.
        --        ,$$$$$$'  $$$$$  `$$$$$$.
        --      ,$$$$$$$'   $$$$$   `$$$$$$$.
        --   ,s$$$$$$$'     $$$$$     `$$$$$$$s.
        -- $$$$$$$$$'       $$$$$       `$$$$$$$$$
        -- $$$$$Y'          $$$$$          `Y$$$$$]],
        --        header = [[
        --   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆
        --    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦
        --          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄
        --           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄
        --          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀
        --   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄
        --  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄
        -- ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄
        -- ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄
        --      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆
        --       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        --        ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃
        --         ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
        --          ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟           ]],
        --      ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶
        --      ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧
        --      ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆
        -- ]],
      },
      sections = {
        { section = "header", padding = 3 },
        { section = "keys", gap = 0, padding = 2 },
        {
          -- icon = " ",
          -- title = "recent",
          section = "recent_files",
          indent = 0,
          padding = 0,
        },
        -- { section = "startup" },
      },
    },
  },
}
