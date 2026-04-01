return {
  {
    "sonph/onehalf",
    priority = 1000,
    config = function()
      local onehalf_vim = require("lazy.core.config").plugins["onehalf"].dir .. "/vim"

      vim.opt.termguicolors = true
      vim.opt.rtp:append(onehalf_vim)
      vim.cmd.colorscheme("onehalfdark")
    end,
  },
}
