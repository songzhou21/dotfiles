local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
  ui = {
    icons = {
      cmd = "",
      config = "",
      event = "",
      ft = "",
      init = "",
      keys = "",
      plugin = "",
      runtime = "",
      require = "",
      source = "",
      start = "",
      task = "",
      lazy = "",
    },
  },
})

require("config.lsp")

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,list:full" -- don't insert, show options

-- line numbers
vim.opt.nu = true

-- textwrap at 80 cols
vim.opt.tw = 80
