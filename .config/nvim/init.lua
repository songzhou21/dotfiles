-- ============================================================
-- Plugin Manager: lazy.nvim
-- ============================================================
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

-- ============================================================
-- Plugins
-- ============================================================
require("lazy").setup({
  -- Theme
  { "ellisonleao/gruvbox.nvim", priority = 1000 , config = true},
  -- Finder
  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      ["--cycle"] = true,
      winopts = {
        preview = {
          hidden = false,
        },
      },
    },
  },
  -- Completion
  {
    "hrsh7th/nvim-cmp",
    version = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-buffer",
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "buffer" },
          { name = "path" },
        }),
        mapping = cmp.mapping.preset.insert({
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
      })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp", lazy = true },
  { "hrsh7th/cmp-path", lazy = true },
  { "hrsh7th/cmp-buffer", lazy = true },
})

-- ============================================================
-- Plugin Keymaps
-- ============================================================
local fzf = require("fzf-lua")
if fzf then
  fzf.setup({
    defaults = {
      formatter = "path.filename_first",
    },
    winopts = {
      preview = { hidden = false },
    },
  })
  vim.keymap.set("n", "<C-p>", fzf.files, { desc = "Fzf Files" })
  vim.keymap.set("n", "gr", fzf.lsp_references, { desc = "Fzf LSP References" })
  vim.keymap.set("n", "q:", "<cmd>FzfLua command_history<cr>", { desc = "Fzf Command History" })
end

-- ============================================================
-- LSP
-- ============================================================
require("config.lsp")

-- ============================================================
-- Editor Options
-- ============================================================
local opt = vim.opt

vim.o.background = "dark" -- or "light" for light mode
vim.cmd([[colorscheme gruvbox]])


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
opt.backspace = { "indent", "eol", "start" }

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = true
opt.gdefault = true

opt.showmode = true
opt.showcmd = true
opt.ruler = true
opt.number = true
opt.cursorline = true
opt.laststatus = 2
opt.listchars = { tab = "» ", trail = "·", eol = "↴", nbsp = "␣" }
opt.splitbelow = true
opt.splitright = true

opt.wildmenu = true
opt.wildmode = "list:longest,list:full"

-- ============================================================
-- Autocmds
-- ============================================================
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

-- ============================================================
-- Leader
-- ============================================================
vim.g.mapleader = " "
vim.g.maplocalleader = " "


-- ============================================================
-- Keymaps
-- ============================================================
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })
vim.keymap.set("n", "<Leader>ve", "<cmd>e $MYVIMRC<CR>", { silent = true })
vim.keymap.set("n", "<leader>l", "<cmd>set list!<CR>", { silent = true })
--buffer
vim.keymap.set("n", "]b", "<cmd>bnext<CR>", { silent = true })
vim.keymap.set("n", "[b", "<cmd>bprevious<CR>", { silent = true })
