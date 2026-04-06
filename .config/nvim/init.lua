vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Disable netrw at startup so nvim-tree can take over directory browsing.
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

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


local opt = vim.opt

opt.fileencoding = "utf-8"
opt.fileencodings = { "ucs-bom", "utf-8", "gb2312", "gbk", "gb18030", "big5", "euc-jp", "euc-kr", "latin1" }

opt.autoindent = true
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.backup = false
opt.wrap = true
opt.textwidth = 79
opt.backspace = { "indent", "eol", "start" }

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.gdefault = true

opt.ruler = true
opt.laststatus = 2
opt.listchars = { tab = "» ", trail = "·", eol = "↴", nbsp = "␣" }
opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "list:longest,list:full"
opt.wildignore:append({ "*/tmp/*", "*.so", "*.swp", "*.zip" })



vim.api.nvim_create_autocmd("VimResized", {
  -- Keep split sizes balanced after the terminal window changes size.
  callback = function()
    vim.cmd.wincmd("=")
  end,
})

vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  pattern = "Podfile",
  callback = function()
    vim.bo.filetype = "ruby"
  end,
})

vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>set list!<CR>", { silent = true })
--buffer
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { silent = true })
