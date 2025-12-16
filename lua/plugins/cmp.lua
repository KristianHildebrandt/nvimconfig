return {
  -- Core cmp + sources
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },
  { "L3MON4D3/LuaSnip",    build = "make install_jsregexp" },
  { "onsails/lspkind.nvim" },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")
      local lspkind = require("lspkind")
      local luasnip = require("luasnip")

      cmp.setup({
        preselect  = cmp.PreselectMode.None,
        completion = { completeopt = "menu,menuone,noinsert" },

        snippet    = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping    = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = true }),

          -- <<< prefer snippet FIRST, then the menu
          ["<Tab>"]     = cmp.mapping(function(fallback)
            if require("luasnip").expand_or_jumpable() then
              require("luasnip").expand_or_jump()
            elseif cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"]   = cmp.mapping(function(fallback)
            if require("luasnip").jumpable(-1) then
              require("luasnip").jump(-1)
            elseif cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources    = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "codeium" }, -- Windsurf source
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 50,
            ellipsis_char = "...",
          }),
        },
      })

      -- Optional: cmdline completion (keep if you like it)
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "path" },
          { name = "cmdline" },
        },
      })

      cmp.setup.cmdline("/", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = { { name = "buffer" } },
      })
    end,
  },
}
