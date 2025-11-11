return {
  -- Reuse the same blink.cmp instance (already loaded by rust.lua)
  -- No need to duplicate it here.

  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "gopls")
      table.insert(opts.ensure_installed, "golines")
      table.insert(opts.ensure_installed, "goimports")
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
          settings = {
            gopls = {
              usePlaceholders = true,
              completeUnimported = true,
              staticcheck = true,
              analyses = { unusedparams = true },
            },
          },
        },
      },
      setup = {
        gopls = function(_, opts)
          -- Optional: format on save with goimports + golines
          vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*.go",
            callback = function()
              local params = vim.lsp.util.make_range_params()
              params.context = { only = { "source.organizeImports" } }
              local result = vim.lsp.buf_request_sync(
                0,
                "textDocument/codeAction",
                params,
                1000
              )
              for _, res in pairs(result or {}) do
                for _, r in pairs(res.result or {}) do
                  if r.edit then
                    vim.lsp.util.apply_workspace_edit(r.edit, "utf-8")
                  end
                end
              end

              vim.lsp.buf.format({ async = false })
            end,
          })
        end,
      },
    },
  },

  -- Optional: go.nvim for extra goodies (run, test, etc.)
  -- {
  --   "ray-x/go.nvim",
  --   dependencies = { "ray-x/guihua.lua" },
  --   config = function()
  --     require("go").setup()
  --   end,
  --   event = { "CmdlineEnter" },
  -- },
}
