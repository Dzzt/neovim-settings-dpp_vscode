local fn = vim.fn
local opt = vim.opt
local plugin_base = fn.expand("~/.config/nvim_vscode/plugins")

opt.runtimepath:append(plugin_base .. "/flash.nvim")
require("config_flash")

opt.runtimepath:append(plugin_base .. "/nvim-surround")
require("config_nvimsurround")
