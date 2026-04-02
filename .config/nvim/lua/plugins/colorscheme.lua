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
  {
    "vim-airline/vim-airline",
    event = "VeryLazy",
    dependencies = {
      "tpope/vim-fugitive",
      "vim-airline/vim-airline-themes",
    },
    init = function()
      local airline_symbols = vim.g.airline_symbols or {}
      airline_symbols.branch = ""
      airline_symbols.dirty = " M"
      airline_symbols.notexists = " ??"
      vim.g.airline_symbols = airline_symbols

      vim.g.airline_powerline_fonts = 1
      vim.g.airline_right_sep = ""
      vim.g.airline_theme = "onehalfdark"
      vim.g.airline_section_c_only_filename = 1
      vim.g.airline_section_y = ""
      vim.g.airline_section_z = "%l:%c"
      vim.g["airline#extensions#branch#enabled"] = 1
      vim.g["airline#extensions#nvimlsp#enabled"] = 1
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
    end,
  },
  {
    "tpope/vim-fugitive",
    lazy = true,
  },
  {
    "vim-airline/vim-airline-themes",
    lazy = true,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("gitsigns").setup()
    end,
  },
}
