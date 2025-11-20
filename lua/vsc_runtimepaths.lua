
local opt = vim.opt
local fn = vim.fn

-- runtimepaths
------------------------------------------------------------------

-- Neovim Home Directory
local neovim_dir = fn.expand('~/.config/nvim_vscode')

--  append to runtimepath
opt.runtimepath:append(neovim_dir)

dpp_dir = neovim_dir .. [[/dpp]]
opt.runtimepath:append(dpp_dir)
opt.runtimepath:append(dpp_dir .. [[/lua]])
opt.runtimepath:append(dpp_dir .. [[/toml]])

-- -------------------------------------------------
--  dpp

-- Directory where plugins are installed in
local dpp_cache_dir = fn.expand("~/.cache/dpp_vscode")
local dpp_repo_dir = dpp_cache_dir .. '/repos'

opt.runtimepath:append(dpp_cache_dir)
opt.runtimepath:append(dpp_repo_dir)
opt.runtimepath:append(dpp_repo_dir .. [[/github.com/Shougo/dpp.vim]])
