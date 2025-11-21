local overseer = require("overseer")

overseer.setup()

-- Register the C++ build template
overseer.register_template({
  name = "C++ Build (make/cmake/ninja)",
  builder = function()
    -- Change this command to whatever you actually use
    local cmd
    if
      vim.fn.filereadable("Makefile") == 1
      or vim.fn.filereadable("makefile") == 1
    then
      cmd = { "make", "-j12" }
    elseif vim.fn.filereadable("CMakeLists.txt") == 1 then
      cmd = { "cmake", "--build", "build", "--", "-j12" }
    else
      -- fallback: simple single-file compile
      local file = vim.fn.expand("%:p")
      local outfile = vim.fn.expand("%:p:r")
      cmd = { "g++", "-std=c++23", "-Wall", "-Wextra", file, "-o", outfile }
    end

    return {
      cmd = cmd,
      cwd = vim.fn.getcwd(),
      components = {
        -- This parses compiler output and fills quickfix
        {
          "on_output_parse",
          parser = {
            diagnostics = {
              -- Main extraction for error/warning lines (using Vim regex flavor)
              {
                "extract",
                { append = false, regex = true },
                [[^\%(.\+\)\@<!:\(\d\+\):\(\d\+\):\?\s*\%(fatal\s\+\)\?\%(error\|warning\):\s*\(.\+\)$]],
                "filename",
                "lnum",
                "col",
                "type",
                "text",
              },
              -- Append multi-line continuation messages (indented lines after the main error)
              {
                "extract_multiline",
                [[^\s*\%(\d\+\s*\)\?|\(.\+\)$]],
                "text",
              },
            },
          },
        },

        -- Overseer window behavior
        {
          "on_complete_notify",
          on_success = "hide",
          on_failure = "always",
        },

        {
          "display_duration",
          "default",
        },
      },
    }
  end,
  tags = { overseer.TAG.BUILD },
  priority = 50,
})
