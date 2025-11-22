return {
  name = "CMake: Build and Run (exe in root)",
  builder = function(params)
    local build_dir = "build"
    local exe = params.exe

    return {
      cmd = { "sh", "-c" },
      args = {
        table.concat({
          "cmake -S . -B " .. build_dir,
          "cmake --build " .. build_dir,
          "./" .. exe,
        }, " && "),
      },
      components = {
        "default",
      },
    }
  end,

  params = {
    exe = {
      desc = "Executable name",
      type = "string",
      default = "game",
    },
  },

  condition = {
    callback = function()
      return vim.fn.filereadable("CMakeLists.txt") == 1
    end,
  },
}
