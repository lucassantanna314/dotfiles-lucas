return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.registries = {
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      }
    end,
  },
  {
    "seblyng/roslyn.nvim",
    ft = { "cs", "razor", "cshtml" },
    dependencies = {
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
    },
    config = function()
      require("roslyn").setup({
        exe = {
          "dotnet",
          vim.fn.stdpath("data") .. "/mason/packages/roslyn/libexec/Microsoft.CodeAnalysis.LanguageServer.dll",
        },
        filewatching = "roslyn",
      })
    end,
  },
}
