return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    config = function()
      vim.opt.termguicolors = true
      require("onedark").setup({
        style = "dark",
      })
      require("onedark").load()
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

      vim.g.airline_powerline_fonts = 0
      vim.g.airline_right_sep = ""
      vim.g.airline_theme = "onedark"
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
}
