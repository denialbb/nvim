return {
  {
    "mfussenegger/nvim-dap",
    event = "VeryLazy",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
      "jay-babu/mason-nvim-dap.nvim",
      "theHamsta/nvim-dap-virtual-text",
    },
    config = function()
      local mason_dap = require("mason-nvim-dap")
      local dap = require("dap")
      local ui = require("dapui")
      local dap_virtual_text = require("nvim-dap-virtual-text")

      -- Dap Virtual Text
      dap_virtual_text.setup()

      mason_dap.setup({
        ensure_installed = { "cppdbg" },
        automatic_installation = {
          exclude = { "chrome", "firefox" },
        },
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })

      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
          args = { "--port", "${port}" },
        },
      }

      -- Configurations
      dap.configurations = {
        c = {
          {
            name = "Launch C (codelldb)",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
              )
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
            runInTerminal = false,
          },
        },
        cpp = {
          {
            name = "Launch C++ (cppdbg)",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/",
                "file"
              )
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
          },
        },
        rust = {
          {
            name = "Launch Rust Program",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input(
                "Path to executable: ",
                vim.fn.getcwd() .. "/target/debug/",
                "file"
              )
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
            args = {},
          },
        },
      }

      -- Dap UI
      ui.setup()
      vim.fn.sign_define("DapBreakpoint", { text = "🐞" })
      dap.listeners.before.attach.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        ui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        ui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        ui.close()
      end
    end,

    keys = {
      {
        "<leader>d",
        group = "Debugger",
        nowait = true,
        remap = false,
      },
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
        nowait = true,
        remap = false,
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
        nowait = true,
        remap = false,
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
        nowait = true,
        remap = false,
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
        nowait = true,
        remap = false,
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
        nowait = true,
        remap = false,
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.open()
        end,
        desc = "Open REPL",
        nowait = true,
        remap = false,
      },
      {
        "<leader>dl",
        function()
          require("dap").run_last()
        end,
        desc = "Run Last",
        nowait = true,
        remap = false,
      },
      {
        "<leader>dq",
        function()
          require("dap").terminate()
          require("dapui").close()
          require("nvim-dap-virtual-text").toggle()
        end,
        desc = "Terminate",
        nowait = true,
        remap = false,
      },
      {
        "<leader>db",
        function()
          require("dap").list_breakpoints()
        end,
        desc = "List Breakpoints",
        nowait = true,
        remap = false,
      },
      {
        "<leader>de",
        function()
          require("dap").set_exception_breakpoints({ "all" })
        end,
        desc = "Set Exception Breakpoints",
        nowait = true,
        remap = false,
      },
    },
  },
  {
    "mason-nvim-dap.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, { "codelldb", "cpptools", "delve" })
      opts.ensure_installed = vim.tbl_filter(function(v)
        return v ~= "chrome-debug-adapter"
      end, opts.ensure_installed)
      return opts
    end,
  },
  {
    "leoluz/nvim-dap-go",
    config = function()
      require("dap-go").setup()
    end,
  },
}
