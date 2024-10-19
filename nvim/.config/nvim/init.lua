vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)

-- dashboard stuff
vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#5eead4" }) -- logo
vim.api.nvim_set_hl(0, "DashboardIcon", { fg = "#8b5cf6" })   -- icon
vim.api.nvim_set_hl(0, "DashboardDesc", { fg = "#c084fc" })   -- description
vim.api.nvim_set_hl(0, "DashboardKey", { fg = "#f0abfc" })    -- key
vim.api.nvim_set_hl(0, "DashboardFooter", { fg = "#f9a8d4" }) -- bottom

vim.o.laststatus = 0

-- set line number colors
vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#737373", bold = false })
vim.api.nvim_set_hl(0, "LineNr", { fg = "#ffffff", bold = true })
vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#737373", bold = false })

require("notify").setup({
  background_colour = "#0a0a0a",
  stages = "fade_in_slide_out",
  timeout = 5000,
  render = "compact",
})

require("oil").setup()
