return {
  -- OneDark theme (your config)
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup({
        style = "warmer", -- 'dark','darker','cool','deep','warm','warmer','light'
      })
      require("onedark").load()
      vim.opt.termguicolors = true
      vim.opt.guifont = "MesloLGS NF:h13" -- only used in GUIs (Neovide/WezTerm GUI/etc.)
    end,
  },

  -- Git signs in the gutter
  { "lewis6991/gitsigns.nvim", config = true },

  -- Fuzzy finder (kept here; depends on plenary which is in its own file)
  { "nvim-telescope/telescope.nvim", tag = "0.1.6", dependencies = { "nvim-lua/plenary.nvim" } },
}
