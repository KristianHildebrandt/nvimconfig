return {
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    config = function()
      require("conform").setup({
        format_on_save = { timeout_ms = 2000, lsp_fallback = true },
        formatters_by_ft = {
          lua       = { "stylua" },
          elixir    = { "mix" },
          python    = { "ruff_format", "ruff_organize_imports", "black" },
          go        = { "gofumpt", "goimports", "golines" }, -- remove golines if undesired
          terraform = { "terraform_fmt" },
          hcl       = { "terraform_fmt" },
          yaml      = { "yamlfmt" }, -- optional
          json      = { "jq" },
        },
      })
    end,
  },
}
