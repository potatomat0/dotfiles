return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "neovim/nvim-lspconfig",
      -- nvim-cmp core + sources
      "hrsh7th/nvim-cmp",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lua",
      "saadparwaiz1/cmp_luasnip",
      -- snippets
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      lsp_zero.on_attach(function(_, bufnr)
        local opts = { buffer = bufnr, remap = false }
        local map = vim.keymap.set
        map("n", "gd", function() vim.lsp.buf.definition() end, opts)
        map("n", "K", function() vim.lsp.buf.hover() end, opts)
        map("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        map("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        map("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        map("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        map("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        map("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        map("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
        map("n", "<leader>qf", function()
          vim.lsp.buf.code_action({ filter = function(a) return a.isPreferred end, apply = true })
        end, { noremap = true, silent = true })
      end)

      require("mason").setup({})
      require("mason-lspconfig").setup({
        ensure_installed = { "zk", "custom_elements_ls", "pylsp", "eslint", "harper_ls", "html", "cssls", "gopls" },
        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            local lua_opts = lsp_zero.nvim_lua_ls()
            require("lspconfig").lua_ls.setup(lua_opts)
          end,
        },
      })

      -- Snippets: load community snippets
      local has_loader, loader = pcall(require, "luasnip.loaders.from_vscode")
      if has_loader then loader.lazy_load() end

      local cmp = require("cmp")
      cmp.setup({
        sources = {
          { name = "path" },
          { name = "nvim_lsp" },
          { name = "nvim_lua" },
          { name = "luasnip", keyword_length = 2 },
          { name = "buffer",  keyword_length = 3 },
        },
        formatting = lsp_zero.cmp_format(),
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<C-Space>"] = cmp.mapping.complete(),
        }),
        snippet = {
          expand = function(args) require("luasnip").lsp_expand(args.body) end,
        },
      })

      -- Cmdline completion
      cmp.setup.cmdline({"/", "?"}, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" }
        }
      })
      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" }
        }, {
          { name = "cmdline" }
        })
      })
    end,
  },
}
