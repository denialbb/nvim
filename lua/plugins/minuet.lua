return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      -- Helper to read keys from opencode auth.json if not in env
      local function get_api_key(provider)
        local home = os.getenv("HOME")
        local path = home .. "/.local/share/opencode/auth.json"
        local f = io.open(path, "r")
        if not f then return nil end
        local content = f:read("*a")
        f:close()
        local ok, data = pcall(vim.fn.json_decode, content)
        if ok and data and data[provider] and data[provider].key then
          return data[provider].key
        end
        return nil
      end

      -- Export api keys to environment variables so that minuet commands/curl can find them
      local gemini_key = os.getenv("GEMINI_API_KEY") or get_api_key("google")
      if gemini_key then
        vim.env.GEMINI_API_KEY = gemini_key
      end

      local nvidia_key = os.getenv("NVIDIA_API_KEY") or get_api_key("nvidia")
      if nvidia_key then
        vim.env.NVIDIA_API_KEY = nvidia_key
      end

      require("minuet").setup({
        -- Default to Llama (via Nvidia)
        provider = "openai_compatible",
        provider_options = {
          gemini = {
            model = "gemini-3.5-flash",
            api_key = "GEMINI_API_KEY",
            stream = true,
          },
          openai_compatible = {
            name = "nvidia",
            end_point = "https://integrate.api.nvidia.com/v1/chat/completions",
            api_key = "NVIDIA_API_KEY",
            model = "meta/llama-3.3-70b-instruct",
            stream = true,
          },
        },
      })
    end,
  },

  -- Integrate with blink.cmp
  {
    "saghen/blink.cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      local default_sources = opts.sources.default
      if type(default_sources) == "function" then
        opts.sources.default = function()
          local list = default_sources()
          if not vim.tbl_contains(list, "minuet") then
            table.insert(list, "minuet")
          end
          return list
        end
      else
        opts.sources.default = default_sources or { "lsp", "path", "snippets", "buffer" }
        if not vim.tbl_contains(opts.sources.default, "minuet") then
          table.insert(opts.sources.default, "minuet")
        end
      end

      opts.sources.providers = opts.sources.providers or {}
      opts.sources.providers.minuet = {
        name = "minuet",
        module = "minuet.blink",
        score_offset = 8, -- adjusts priority in completion list
      }
    end,
  },
}
