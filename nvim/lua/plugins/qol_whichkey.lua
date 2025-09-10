return {
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    config = function()
      local wk = require("which-key")
      wk.setup({})
      wk.add({
        { "<leader>f", group = "Find" },
        { "<leader>g", group = "Git" },
        { "<leader>b", group = "Build" },
        { "<leader>e", group = "Explore" },
        { "<leader>v", group = "LSP" },
        { "<leader>u", desc = "Toggle Undotree" },
        { "<leader>a", desc = "Harpoon add file" },
      })
    end,
  },
}
