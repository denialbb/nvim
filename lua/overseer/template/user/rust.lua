return {
  name = "Rust: Run (centered float)",
  builder = function(params)
    local cmd = { "cargo", "run" }

    return {
      cmd = cmd,
      name = "Rust Run",
      components = {
        { "on_output_summarize", max_lines = 10 }, -- Summarize output if too long
        "default",
        display = "float",
        border = "rounded",
      },
      "on_complete_dispose",
    }
  end,
  desc = "Run Rust project in a centered floating terminal",
  tags = { "build", "test" },
  params = {},
  priority = 50,
  condition = {
    filetype = { "rust" },
    dir_is_cargo_project = true,
  },
}
