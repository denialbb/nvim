return {
  {
    "milanglacier/minuet-ai.nvim",
    config = function()
      -- Helper to read keys from opencode auth.json if not in env
      local function get_api_key(provider)
        local home = os.getenv("HOME")
        local path = home .. "/.local/share/opencode/auth.json"
        local f = io.open(path, "r")
        if not f then
          return nil
        end
        local content = f:read("*a")
        f:close()
        local ok, data = pcall(vim.fn.json_decode, content)
        if ok and data and data[provider] and data[provider].key then
          return data[provider].key
        end
        return nil
      end

      -- Export api keys to environment variables so that
      -- minuet commands/curl can find them

      local mistral_key = os.getenv("MISTRAL_API_KEY") or get_api_key("mistral")
      if mistral_key then
        vim.env.MISTRAL_API_KEY = mistral_key
      end
      local nvidia_key = os.getenv("NVIDIA_API_KEY") or get_api_key("nvidia")
      if nvidia_key then
        vim.env.NVIDIA_API_KEY = nvidia_key
      end

      require("minuet").setup({
        provider = "openai_compatible",
        request_timeout = 3,

        provider_options = {
          openai_compatible = {
            name = "nvidia",
            end_point = "https://integrate.api.nvidia.com/v1/chat/completions",
            api_key = "NVIDIA_API_KEY",
            model = "qwen/qwen3-next-80b-a3b-instruct",
            stream = false,

            optional = {
              temperature = 0,
              top_p = 1,
              max_tokens = 64,
            },
          },
        },
        virtualtext = {
          enabled = true,

          auto_trigger_ft = {
            "lua",
            "python",
            "javascript",
            "typescript",
            "go",
            "rust",
            "c",
            "cpp",
          },

          keymap = {
            accept = "<C-a>",
            accept_line = "<C-l>",
            next = "<C-j>",
            prev = "<C-k>",
            dismiss = "<C-e>",
          },
        },
      })
    end,
  },
}
