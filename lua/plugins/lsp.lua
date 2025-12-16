return {
  -- Core LSP + installer + schemas (Neovim 0.11+ API)
  { "williamboman/mason.nvim",          config = true,                             build = ":MasonUpdate" },
  { "williamboman/mason-lspconfig.nvim" },
  { "b0o/SchemaStore.nvim" },

  -- Elixir
  { "elixir-tools/elixir-tools.nvim",   dependencies = { "nvim-lua/plenary.nvim" } },

  -- Kubernetes helpers
  { "diogo464/kubernetes.nvim" }, -- feeds CRDs to yamlls
  { "towolf/vim-helm",                  ft = "helm" },

  {
    -- Native LSP config using Neovim 0.11+ API (no require('lspconfig').*.setup)
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "williamboman/mason.nvim", "williamboman/mason-lspconfig.nvim", "hrsh7th/cmp-nvim-lsp" },
    config = function()
      local mason = require("mason")
      local mlsp = require("mason-lspconfig")
      local cmp_lsp = require("cmp_nvim_lsp")
      local schemastore = require("schemastore")

      local capabilities = cmp_lsp.default_capabilities()

      -- Common on_attach: standard LSP keymaps
      local function on_attach(_, bufnr)
        local function map(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
        end
        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gr", vim.lsp.buf.references, "References")
        map("n", "K", vim.lsp.buf.hover, "Hover")
        map("n", "gi", vim.lsp.buf.implementation, "Implementation")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>fd", vim.diagnostic.open_float, "Line diagnostics")
        map("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        map("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
      end

      mason.setup({})
      mlsp.setup({
        ensure_installed = {
          -- Lua
          "lua_ls",
          -- Python
          "pyright", "ruff",
          -- Go
          "gopls", "golangci_lint_ls",
          -- IaC
          "terraformls", "tflint",
          -- YAML / K8s
          "yamlls",
        },
        automatic_installation = true,
      })

      -- Define per-server configs with the native API
      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })

      vim.lsp.config("pyright", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("ruff",
        { capabilities = capabilities, on_attach = on_attach, init_options = { settings = { args = {} } } })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          gopls = {
            usePlaceholders = true,
            analyses = { unusedparams = true, shadow = true, nilness = true },
            staticcheck = true,
            gofumpt = true,
          },
        },
      })
      vim.lsp.config("golangci_lint_ls", { capabilities = capabilities, on_attach = on_attach })

      vim.lsp.config("terraformls", { capabilities = capabilities, on_attach = on_attach })
      vim.lsp.config("tflint", { capabilities = capabilities, on_attach = on_attach })

      vim.lsp.config("yamlls", {
        capabilities = capabilities,
        on_attach = on_attach,
        settings = {
          yaml = {
            schemaStore = { enable = false, url = "" },
            schemas = schemastore.yaml.schemas(),
            validate = true,
            keyOrdering = false,
          },
        },
      })

      -- Elixir via elixir-tools (ElixirLS by default; flip nextls.enable=true to use Next LS)
      local elixir   = require("elixir")
      local elixirls = require("elixir.elixirls")

      elixir.setup({
        nextls = { enable = false }, -- you're not using Next LS
        -- optional: credo helpers
        -- credo = { enable = true },

        elixirls = {
          enable = true,                                        -- use ElixirLS
          cmd = { vim.fn.stdpath("data") .. "/mason/bin/elixir-ls" }, -- Mason path
          on_attach = on_attach,
          settings = elixirls.settings({
            dialyzerEnabled  = false, -- big speed win
            enableTestLenses = false,
            fetchDeps        = false, -- don't run mix deps.get on attach
            -- suggestSpecs   = false,          -- optional
          }),
        },
      })

      -- Activate all configured servers for their filetypes
      vim.lsp.enable({
        "lua_ls", "pyright", "ruff", "gopls", "golangci_lint_ls", "terraformls", "tflint", "yamlls",
      })

      -- K8s: command to refresh CRDs into yamlls
      vim.api.nvim_create_user_command("KRefresh", function()
        require("kubernetes").refresh()
      end, {})
    end,
  },
}
