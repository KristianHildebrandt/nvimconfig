return {
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
    event = "InsertEnter",
    dependencies = {
      "rafamadriz/friendly-snippets", -- ensure on rtp before we lazy_load()
    },
    config = function()
      local ls = require("luasnip")

      ls.setup({
        history = true,
        updateevents = "TextChanged,TextChangedI",
        enable_autosnippets = true,
      })

      -- Load snippet packs AFTER friendly-snippets is on rtp
      local vs_loader = require("luasnip.loaders.from_vscode")
      vs_loader.lazy_load() -- loads friendly-snippets
      -- Optional: your own VSCode-format snippets folder
      vs_loader.lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets" } })

      -- Share Elixir snippets with HEEx/EEx/Surface
      ls.filetype_extend("eelixir", { "elixir" })
      ls.filetype_extend("heex", { "elixir", "eelixir", "html" })
      ls.filetype_extend("surface", { "elixir", "eelixir", "html" })

      -- Optional: reverse jump if cmp didn't handle it
      vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
        if ls.jumpable(-1) then ls.jump(-1) end
      end, { silent = true })
    end,
  },

  -- Make sure cmp shows snippet items (keeps your existing cmp.lua intact)
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      local has = false
      for _, s in ipairs(opts.sources) do
        if s.name == "luasnip" then
          has = true
          break
        end
      end
      if not has then table.insert(opts.sources, { name = "luasnip" }) end
      return opts
    end,
  },
}
