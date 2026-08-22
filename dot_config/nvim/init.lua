vim.o.termguicolors = true
vim.o.background = "dark"

vim.cmd.colorscheme("habamax")
vim.api.nvim_set_hl(0, "Normal", { bg = "#000000" })
vim.opt.guicursor = "a:block"
vim.opt.guicursor = "i:blinkwait300-blinkon200-blinkoff150-block"
-- tab settings
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = false

-- hotkeys
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "Save file" })
vim.keymap.set({ "n", "i", "v" }, "<C-x>", "<cmd>confirm q<CR>", { desc = "Quit with confirmation" })
vim.keymap.set("n", "<C-e>", "A", { desc = "Go to end of line" })
vim.keymap.set("i", "<C-e>", "<Esc>A", { desc = "Go to end of line (insert)" })
vim.keymap.set("n", "<C-a>", "I", { desc = "Go to start of line" })
vim.keymap.set("i", "<C-a>", "<Esc>I", { desc = "Go to start of line (insert)" })
vim.keymap.set("n", "<A-Up>", "<C-y>")
vim.keymap.set("n", "<A-Down>", "<C-e>")
vim.keymap.set('i', '<C-Up>', '<C-o><C-y>')
vim.keymap.set('i', '<C-Down>', '<C-o><C-e>')
vim.keymap.set("n", "<Space>", "za", { desc = "Toggle fold" })
vim.keymap.set({ "v", "i", "n" }, "<C-S-c", '"+y')
vim.keymap.set("n", "<Esc>", function()
  vim.cmd("nohlsearch")
end)

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- mouse mouse settings
vim.opt.mouse = "a"

-- lazy.nvim plugin controller
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

vim.opt.number = true

vim.o.winbar = "%{%v:lua.require'nvim-navic'.get_location()%}"

-- folding
vim.opt.foldmethod = "syntax"
vim.opt.foldlevel = 99
vim.opt.foldenable = true
vim.opt.foldcolumn = "1"

-- russification
vim.opt.langmap =
  "ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;" ..
  "ABCDEFGHIJKLMNOPQRSTUVWXYZ," ..
  "фисвуапршолдьтщзйкыегмцчня№;" ..
  "abcdefghijklmnopqrstuvwxyz/"
