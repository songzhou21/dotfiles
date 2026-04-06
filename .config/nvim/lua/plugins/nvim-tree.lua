return {
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },
    config = function()
      require("nvim-tree").setup({
        renderer = {
          icons = {
            show = {
              file = true,
              folder = true,
              folder_arrow = true,
              git = true,
            },
            glyphs = {
              default = ".",
              symlink = "@",
              modified = "*",
              hidden = ".",
              folder = {
                arrow_closed = "+",
                arrow_open = "-",
                default = "/",
                open = "/",
                empty = "/",
                empty_open = "/",
                symlink = "@",
                symlink_open = "@",
              },
              git = {
                unstaged = "M",
                staged = "A",
                unmerged = "U",
                renamed = "R",
                untracked = "?",
                deleted = "D",
                ignored = "I",
              },
            },
          },
        },
      })
    end,
  },
}
