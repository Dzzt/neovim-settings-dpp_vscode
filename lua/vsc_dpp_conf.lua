--config for vscode neovim

local fn = vim.fn
local opt = vim.opt
local api = vim.api
-----------------------------------------------------------------------------------

-- dpp 動作設定の typescript
local vsc_dpp_config_ts = fn.expand("~/.config/nvim_vscode/dpp/vsc_dpp_config.ts")

--
--~/.cache/dpp_vscode 
local cache_dir = fn.expand("~/.cache/dpp_vscode/repos/github.com")
local repo_dir = cache_dir .. "/repos/github.com"
local dpp_src = repo_dir .. "/Shougo/dpp.vim"

-- denops.vim installed path
local denops_src = repo_dir .. "/vim-denops/denops.vim"

-- paths of dpp extentions
local ext_lazy = repo_dir .. "/Shougo/dpp-ext-lazy"
local ext_toml = repo_dir .. "/Shougo/dpp-ext-toml"
local protocl_git = repo_dir .. "/Shougo/dpp-protocol-git"


--
-- dpp.vim must be added for the first place
opt.runtimepath:prepend(dpp_src)

-- and add extensions
opt.runtimepath:append(ext_lazy)
opt.runtimepath:append(ext_toml)
opt.runtimepath:append(protocl_git)


--
-- require dpp.vim
local dpp = require("dpp")

-- when loading dpp.vim is successful
if dpp.load_state(cache_dir) then

  -- add denops.vim to runtimepaths
  opt.runtimepath:prepend(denops_src)

  -- make state.vim as defined in vsc_dpp_config_ts
  api.nvim_create_autocmd("User", {
	pattern = "DenopsReady",
  	callback = function ()
		vim.notify("vim load_state is failed.")
  		dpp.make_state(cache_dir, vsc_dpp_config_ts)
  	end
  })
end

-- to check the result of dpp#make_state() 
--api.nvim_create_autocmd("User", {
--	pattern = "Dpp:makeStatePost",
--	callback = function ()
--		vim.notify("dpp make_state() is done.")
--	end
--})
