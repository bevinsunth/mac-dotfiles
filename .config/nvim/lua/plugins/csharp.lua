local function dotnet_root()
  local handle = io.popen("dotnet --info 2>/dev/null")
  if handle then
    local base_path = handle:read("*a"):match("Base Path:%s+([%S]+)")
    handle:close()
    if base_path then
      local root = vim.fn.fnamemodify(base_path, ":h:h")
      if vim.fn.isdirectory(root .. "/shared") == 1 then
        return root
      end
    end
  end
  local candidates = {
    "/opt/homebrew/opt/dotnet/libexec",
    "/usr/local/share/dotnet",
  }
  if vim.env.HOME then
    candidates[#candidates + 1] = vim.env.HOME .. "/.dotnet"
  end
  for _, candidate in ipairs(candidates) do
    if vim.fn.isdirectory(candidate .. "/shared") == 1 then
      return candidate
    end
  end
  return nil
end

local root = dotnet_root()
if root then
  vim.env.DOTNET_ROOT = root
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        omnisharp = false,
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = { "roslyn-language-server" },
    },
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor" },
    opts = {},
  },
}
