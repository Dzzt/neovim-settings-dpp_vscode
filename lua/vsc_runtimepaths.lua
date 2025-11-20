
local opt = vim.opt
local fn = vim.fn

-- runtimepaths
------------------------------------------------------------------

-- Neovim Home Directory
local neovim_dir = fn.expand('~/.config/nvim_vscode')

--  append to runtimepath
opt.runtimepath:append(neovim_dir)

dpp_config_dir = neovim_dir .. [[/dpp]]
opt.runtimepath:append(dpp_config_dir)
opt.runtimepath:append(dpp_config_dir .. [[/lua]])
opt.runtimepath:append(dpp_config_dir .. [[/toml]])



