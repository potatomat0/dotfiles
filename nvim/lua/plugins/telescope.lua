return {
  {
    "nvim-telescope/telescope.nvim",
    version = false,
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      { "<leader>f",  function() require("telescope.builtin").find_files() end,                                 desc = "Files (cwd)" },
      { "<leader>fd", function() require("telescope.builtin").find_files({ cwd = vim.fn.expand("%:p:h") }) end, desc = "Files (file dir)" },
      { "<leader>fp", function() require("telescope.builtin").find_files({ cwd = vim.fn.getcwd(-1, 0) }) end,   desc = "Files (initial cwd)" },
      { "<leader>F",  function() require("telescope.builtin").find_files({ cwd = vim.loop.os_homedir() }) end,   desc = "Files (~)" },
      { "<leader>fg", function() require("telescope.builtin").git_files() end,                                  desc = "Git files" },
    },
  },
}
