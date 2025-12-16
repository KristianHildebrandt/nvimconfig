return {
  {
    "danymat/neogen",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "Neogen" },
    keys = {
      { "<leader>ng", function() require("neogen").generate() end, desc = "Generate docstring" },
    },
    opts = {
      snippet_engine = "luasnip",
      -- set your defaults per language
      languages = {
        python = { template = { annotation_convention = "google" } },    -- or "numpy"
        typescript = { template = { annotation_convention = "tsdoc" } }, -- or "jsdoc"
        javascript = { template = { annotation_convention = "jsdoc" } },
        lua = { template = { annotation_convention = "ldoc" } },
        elixir = { template = { annotation_convention = "elixir" } }, -- basic @doc/@moduledoc
      },
    },
  },
}
