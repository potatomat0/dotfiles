return {
  {
    "rcarriga/nvim-notify",
    event = "VeryLazy",
    config = function()
      local notify = require("notify")
      local bg = "#000000"
      local ok, palettes = pcall(require, "catppuccin.palettes")
      if ok then
        local p = palettes.get_palette("mocha")
        if p and p.mantle then bg = p.mantle end
      end
      notify.setup({
        stages = "fade",
        background_colour = bg,
      })
      vim.notify = notify
    end,
  },
}
